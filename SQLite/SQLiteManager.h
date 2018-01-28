//
//  SQLiteManager.h
//  SQLite
//
//  Created by 小飞鸟 on 2018/1/17.
//  Copyright © 2018年 小飞鸟. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SQLiteManager : NSObject
/*单例*/
+(SQLiteManager*)shareManager;
/*打开数据库*/
-(void)openSqlite;
/*关闭数据库*/
-(void)closeSqlite;
/*创建表*/
-(void)createTable;
/*插入数据*/
-(void)insertIntoData;
/*更新数据*/
-(void)updateData;
/*删除数据*/
-(void)deleteData;
/*查询数据*/
-(void)selectData;

@end
