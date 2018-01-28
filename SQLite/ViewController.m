//
//  ViewController.m
//  SQLite
//
//  Created by 小飞鸟 on 2018/1/17.
//  Copyright © 2018年 小飞鸟. All rights reserved.
//

#import "ViewController.h"
#import "SQLiteManager.h"

@interface ViewController ()

@end

@implementation ViewController
- (IBAction)openSqlite:(id)sender {
    [[SQLiteManager shareManager]openSqlite];;
}
- (IBAction)createtable:(id)sender {
     [[SQLiteManager shareManager]createTable];;
}
- (IBAction)addData:(id)sender {
    
     [[SQLiteManager shareManager]insertIntoData];;
}
- (IBAction)updateData:(id)sender {
     [[SQLiteManager shareManager]updateData];;
}
- (IBAction)selectData:(id)sender {
      [[SQLiteManager shareManager]selectData];;
}
- (IBAction)deleteData:(id)sender {
     [[SQLiteManager shareManager]deleteData];;
}
- (IBAction)closeSqlite:(id)sender {
     [[SQLiteManager shareManager]closeSqlite];;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
}
@end
