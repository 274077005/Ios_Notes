//
//  FMDBViewController.m
//  skyer工程集合
//
//  Created by SoKing on 2017/4/19.
//  Copyright © 2017年 skyer. All rights reserved.
//

#import "FMDBViewController.h"
#import "Person.h"
#import "JQFMDB.h"

@interface FMDBViewController ()

@end

@implementation FMDBViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    JQFMDB *db = [JQFMDB shareDatabase];
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        NSLog(@"%@",kDocumentPath);
        //创建数据库表
        if (![db jq_isExistTable:@"user"]) {
            [db jq_createTable:@"user" dicOrModel:[Person class]];
            
        }
    });
    
    
    Person *person = [[Person alloc] init];
    person.name = @"cleanmonkey";
    person.phoneNum = @(18866668888);
    person.photoData = UIImagePNGRepresentation([UIImage imageNamed:@"bg.jpg"]);
    person.luckyNum = 7;
    person.sex = 0;
    person.age = 26;
    person.height = 172.12;
    person.weight = 120.4555;
    
    
    
    //异步(防止UI卡死)插入一条数据, 也同样可以使用线程安全的方法(在jq_inDatabase的block中插入)
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        
        BOOL success =[db jq_insertTable:@"user" dicOrModel:person];
        
        
        if (success) {
            NSLog(@"插入成功");
            //异步(防止UI卡死)查找name=cleanmonkey
            dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
                NSArray *personArr = [db jq_lookupTable:@"user" dicOrModel:[Person class] whereFormat:nil];
                
                dispatch_sync(dispatch_get_main_queue(), ^{
                    
                    Person *person1 = [[Person alloc] init];
                    person1=[personArr objectAtIndex:0];
                    NSLog(@"(async)name=%@", person1.name);
                    
                });
                
            });
        }else{
            NSLog(@"插入失败");
        }
        
        
    });
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
