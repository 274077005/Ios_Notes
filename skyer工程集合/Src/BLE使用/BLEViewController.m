//
//  BLEViewController.m
//  skyer工程集合
//
//  Created by SoKing on 17/3/15.
//  Copyright © 2017年 skyer. All rights reserved.
//

#import "BLEViewController.h"

#import "PeripheralInfo.h"



@interface BLEViewController ()

@property (nonatomic, strong) UITableView *tableView;

@end


#define channelOnCharacteristicView @"BLEView"

@implementation BLEViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"蓝牙4.0开发");
    
    self.title=@"蓝牙4.0开发";
    // Do any additional setup after loading the view.
    self.arrPeripheral = [[NSMutableArray alloc]init];
    self.arrServicesa = [[NSMutableArray alloc]init];
    self.arrCharacteristics = [[NSMutableArray alloc]init];
    
    _tableView=[[UITableView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:_tableView];
    _tableView.delegate=self;
    _tableView.dataSource=self;
    [_tableView reloadData];
    
    
    //初始化BabyBluetooth 蓝牙库
    _baby = [BabyBluetooth shareBabyBluetooth];
    
    //设置蓝牙委托
    [self babyDelegate];
    
    //设置委托后直接可以使用，无需等待CBCentralManagerStatePoweredOn状态。
    _baby.scanForPeripherals().begin();

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -蓝牙配置和操作

//蓝牙网关初始化和委托方法设置
-(void)babyDelegate{
    
    __weak typeof(self) weakSelf = self;
    
    [_baby setBlockOnCentralManagerDidUpdateState:^(CBCentralManager *central) {
        if (central.state == CBManagerStatePoweredOn) {
            NSLog(@"设备打开成功，开始扫描设备");
        }
    }];
    
    //设置查找设备的过滤器
    [_baby setFilterOnDiscoverPeripherals:^BOOL(NSString *peripheralName, NSDictionary *advertisementData, NSNumber *RSSI) {
        
        if (peripheralName.length >0) {
            return YES;
        }

//        if([peripheralName hasPrefix:@"H"])
//            
//        {
//            return YES;
//        }
        
        return NO;
    }];
    
    //设置扫描到设备的委托
    [_baby setBlockOnDiscoverToPeripherals:^(CBCentralManager *central, CBPeripheral *peripheral, NSDictionary *advertisementData, NSNumber *RSSI) {
        
        NSLog(@"扫描到的数据=%@",advertisementData);
        
        NSLog(@"搜索到了设备:%@",peripheral.name);
        [weakSelf insertTableView:peripheral advertisementData:advertisementData RSSI:RSSI];
    }];

    
    [_baby setBlockOnCancelAllPeripheralsConnectionBlock:^(CBCentralManager *centralManager) {
        NSLog(@"setBlockOnCancelAllPeripheralsConnectionBlock");
    }];
    
    [_baby setBlockOnCancelScanBlock:^(CBCentralManager *centralManager) {
        NSLog(@"setBlockOnCancelScanBlock");
    }];
    
    
    NSDictionary *scanForPeripheralsWithOptions = @{CBCentralManagerScanOptionAllowDuplicatesKey:@YES};
    //连接设备->
    [_baby setBabyOptionsWithScanForPeripheralsWithOptions:scanForPeripheralsWithOptions connectPeripheralWithOptions:nil scanForPeripheralsWithServices:nil discoverWithServices:nil discoverWithCharacteristics:nil];
    
    
    
    /*==================================连接蓝牙==================================*/
    //设置设备连接成功的委托,同一个baby对象，使用不同的channel切换委托回调
    [_baby setBlockOnConnected:^(CBCentralManager *central, CBPeripheral *peripheral) {
        NSLog(@"%@",[NSString stringWithFormat:@"设备：%@--连接成功",peripheral.name]);
    }];
    //设置设备连接失败的委托
    [_baby setBlockOnFailToConnect:^(CBCentralManager *central, CBPeripheral *peripheral, NSError *error) {
        NSLog(@"设备：%@--连接失败",peripheral.name);
    }];
    //设置设备断开连接的委托
    [_baby setBlockOnDisconnect:^(CBCentralManager *central, CBPeripheral *peripheral, NSError *error) {
        NSLog(@"设备：%@--断开连接",peripheral.name);
    }];
    
    /*===============================连接成功后获取服务和特征值========================*/
    
    //设置发现设备的Services的委托(发现设备里面有多少个服务)
    
    [_baby setBlockOnDiscoverServices:^(CBPeripheral *peripheral, NSError *error) {
        
        for (CBService *service in peripheral.services){
            PeripheralInfo *info = [[PeripheralInfo alloc]init];
            [info setServiceUUID:service.UUID];
            [weakSelf.arrServicesa addObject:info];
        }
        
    }];
    
    
    //设置发现设service的Characteristics的委托（发现服务里面有多少个特征值,每个服务都有对应的特征值）
    [_baby setBlockOnDiscoverCharacteristics:^(CBPeripheral *peripheral, CBService *service, NSError *error) {
        
        
        for (int i =0; i<peripheral.services.count; ++i) {
            
            CBService *ser=peripheral.services[i];
            
            if ([service isEqual:ser]) {
                
                for (CBCharacteristic *characteristic in service.characteristics) {
                    [weakSelf.arrCharacteristics addObject:characteristic];
                    NSLog(@"%d哪个服务：%@：名称%@===value=%@",i,service.UUID,characteristic.UUID,characteristic.value);
                }
            }
        }
        

    }];
    
    //设置读取最新的characteristics的委托（订阅特征值的时候有更新就返回）
    [_baby setBlockOnReadValueForCharacteristic:^(CBPeripheral *peripheral, CBCharacteristic *characteristics, NSError *error) {
        
        NSLog(@"最新的特征值的:%@ value is:%@",characteristics.UUID,characteristics.value);
        
    }];
    
    //设置发现characteristics的descriptors的委托
    [_baby setBlockOnDiscoverDescriptorsForCharacteristic:^(CBPeripheral *peripheral, CBCharacteristic *characteristic, NSError *error) {
        NSLog(@"设置特征值描述的委托:%@",characteristic.service.UUID);
    }];
    
    //设置读取Descriptor的委托
    [_baby setBlockOnReadValueForDescriptors:^(CBPeripheral *peripheral, CBDescriptor *descriptor, NSError *error) {
        NSLog(@"获得描述的名称和数值:%@ value is:%@",descriptor.characteristic.UUID, descriptor.value);
    }];
    
    
    /*==================================数据的读写====================================*/
    //设置写数据成功的block
    [_baby setBlockOnDidWriteValueForCharacteristic:^(CBCharacteristic *characteristic, NSError *error) {
        
        NSLog(@"写值特征成功时候返回 characteristic:%@ and new value:%@",characteristic.UUID, characteristic.value);
        
        
    }];
    
    //设置通知状态改变的block
    [_baby setBlockOnDidUpdateNotificationStateForCharacteristic:^(CBCharacteristic *characteristic, NSError *error) {
        NSLog(@"uid:%@,通知状态:%@",characteristic.UUID,characteristic.isNotifying?@"on":@"off");
    }];
    
}



#pragma mark - 写入数据
//写一个值
-(void)writeValue:(CBPeripheral*)currPeripheral andCharacteristic:(CBCharacteristic*)characteristic{
    //    int i = 1;
    Byte b = 0X01;
    NSData *data = [NSData dataWithBytes:&b length:sizeof(b)];
    
    [currPeripheral writeValue:data forCharacteristic:characteristic type:CBCharacteristicWriteWithResponse];
}
#pragma mark -UIViewController 方法
//插入table数据
-(void)insertTableView:(CBPeripheral *)peripheral advertisementData:(NSDictionary *)advertisementData RSSI:(NSNumber *)RSSI{
    
    NSArray *peripherals = [_arrPeripheral valueForKey:@"peripheral"];
    
    if(![peripherals containsObject:peripheral]) {
        NSMutableArray *indexPaths = [[NSMutableArray alloc] init];
        NSIndexPath *indexPath = [NSIndexPath indexPathForRow:peripherals.count inSection:0];
        [indexPaths addObject:indexPath];
        
        NSMutableDictionary *item = [[NSMutableDictionary alloc] init];
        [item setValue:peripheral forKey:@"peripheral"];
        [item setValue:RSSI forKey:@"RSSI"];
        [item setValue:advertisementData forKey:@"advertisementData"];
        [_arrPeripheral addObject:item];
        
        [self.tableView insertRowsAtIndexPaths:indexPaths withRowAnimation:UITableViewRowAnimationAutomatic];
    }
}
#pragma mark -table委托 table delegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _arrPeripheral.count;
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"cell"];
    NSDictionary *item = [_arrPeripheral objectAtIndex:indexPath.row];
    CBPeripheral *peripheral = [item objectForKey:@"peripheral"];
    NSDictionary *advertisementData = [item objectForKey:@"advertisementData"];
    NSNumber *RSSI = [item objectForKey:@"RSSI"];
    
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cell"];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    //peripheral的显示名称,优先用kCBAdvDataLocalName的定义，若没有再使用peripheral name
    NSString *peripheralName;
    if ([advertisementData objectForKey:@"kCBAdvDataLocalName"]) {
        peripheralName = [NSString stringWithFormat:@"%@",[advertisementData objectForKey:@"kCBAdvDataLocalName"]];
    }else if(!([peripheral.name isEqualToString:@""] || peripheral.name == nil)){
        peripheralName = peripheral.name;
    }else{
        peripheralName = [peripheral.identifier UUIDString];
    }
    
    cell.textLabel.text = peripheralName;
    //信号和服务
    cell.detailTextLabel.text = [NSString stringWithFormat:@"RSSI:%@",RSSI];
    
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    //停止扫描
    [_baby cancelScan];
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    
    NSLog(@"%@",[_arrPeripheral objectAtIndex:indexPath.row]);
    
    NSDictionary *item = [_arrPeripheral objectAtIndex:indexPath.row];
    CBPeripheral *peripheral = [item objectForKey:@"peripheral"];
    
    //点击开始连接
    _baby.having(peripheral).and.then.connectToPeripherals().discoverServices().discoverCharacteristics().readValueForCharacteristic().discoverDescriptorsForCharacteristic().readValueForDescriptors().begin();
    
    

//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(10 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//        
////        NSLog(@"服务=%@",_arrServicesa);
//        /*(1.notify 2.write 3.write without response 4. write notify 5. read)
//         特征值=(
//         "<CBCharacteristic: 0x1702a2580, UUID = 6E400003-B5A3-F393-E0A9-E50E24DCCA9E, properties = 0x10, value = <ab>, notifying = NO>",
//         "<CBCharacteristic: 0x1702a2400, UUID = 6E400002-B5A3-F393-E0A9-E50E24DCCA9E, properties = 0xC, value = <09>, notifying = NO>",
//         "<CBCharacteristic: 0x1702a2640, UUID = 00001532-1212-EFDE-1523-785FEABCD123, properties = 0x4, value = (null), notifying = NO>",
//         "<CBCharacteristic: 0x1702a26a0, UUID = 00001531-1212-EFDE-1523-785FEABCD123, properties = 0x18, value = (null), notifying = NO>",
//         "<CBCharacteristic: 0x1702a2700, UUID = 00001534-1212-EFDE-1523-785FEABCD123, properties = 0x2, value = <0100>, notifying = NO>"
//         )
//         */
//        
//        
//        NSLog(@"特征值=%@",_arrCharacteristics);
//        
//        
//    });
    
#pragma mark - 对有写入权限的特征值进行数据写入
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        //协议包含起始帧+ID、数据长度、数据0、数据包头、数据1、等信息.

        
        
        Byte byte[5]={0XAB,0X03,0XFF,0X71,0x80};
        NSData * data = [NSData dataWithBytes:byte length:sizeof(byte)];
        
        NSLog(@"发送过去的数据%@",data);
        
        //对哪个特征值进行数据写入
        [peripheral writeValue:data forCharacteristic:[_arrCharacteristics objectAtIndex:4] type:CBCharacteristicWriteWithResponse];
        
        
    });

    
#pragma mark - 开启有通知权限的特征值获取数据更新
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(10 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//        //对指定特征值进行监听
//        CBCharacteristic *characteristic = [_arrCharacteristics objectAtIndex:3];
//        NSLog(@"characteristic==%@",characteristic);
//        if(peripheral.state != CBPeripheralStateConnected) {
//            NSLog(@"peripheral已经断开连接，请重新连接");
//            return;
//        }
//        if (characteristic.properties & CBCharacteristicPropertyNotify ||  characteristic.properties & CBCharacteristicPropertyIndicate) {
//            
//            if(!characteristic.isNotifying) {
//                [peripheral setNotifyValue:YES forCharacteristic:characteristic];
//                [_baby notify:peripheral characteristic:characteristic block:^(CBPeripheral *peripheral, CBCharacteristic *characteristics, NSError *error) {
//                    
//                    NSLog(@"new value %@",characteristics.value);
//                    
//                }];
//            }
//        }
//        else{
//            NSLog(@"这个characteristic没有nofity的权限");
//            return;
//        }
//    });
//
    
#pragma mark - 获得指定特征值的数据
//    /*获得指定特征值的数据*/
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//        CBCharacteristic *characteristic = [_arrCharacteristics objectAtIndex:4];
//        
//        _baby.characteristicDetails(peripheral,characteristic);
//        
//    });
    
}

@end
