//
//  MXSViewController.m
//  MXSKit
//
//  Created by Michauxs on 05/21/2024.
//  Copyright (c) 2024 Michauxs. All rights reserved.
//

/**
 报错问题："pod trunk push一直提示已改过的错误"可能是因为你尝试推送的库版本与远程仓库中已存在的版本号重复了。

 解决方法：

 检查版本号：确保你的Podspec文件中的版本号是唯一的，并且没有重复。你可以通过pod trunk me命令来查看你的账户信息和已推送的版本。

 更新版本号：如果你确定没有问题，可能是远程仓库出现了问题。你可以尝试更新版本号，比如从0.1更新到0.2，然后再次执行pod trunk push。
         # cd 到 组件ZJWeakProxy路径下
         mac@bogon Example % cd /Users/mac/Desktop/ZJComponent/ZJWeakProxy
         # 添加github项目路径
         mac@bogon ZJWeakProxy % git remote add origin https://github.com/BboyZ/ZJWeakProxy.git
         # 添加文件
         mac@bogon ZJWeakProxy % git add .
         # 将暂存区里的改动提交到本地的版本库
         mac@bogon ZJWeakProxy % git commit -m "first commit"
         # 创建分支main
         mac@bogon ZJWeakProxy % git branch -M master
         # 提交版本号并push到main分支
         mac@bogon ZJWeakProxy % git push -u origin master

         # 注意这里的版本号要与.podspec中的版本号保持一致
         mac@bogon ZJWeakProxy % git tag 0.1.0
         mac@bogon ZJWeakProxy % git push origin 0.1.0

 清理缓存：有时候本地的CocoaPods缓存可能会导致问题。你可以尝试执行pod cache clean --all然后再次执行pod trunk push。
 检查权限：确保你有权限推送到该仓库。如果没有，你可能需要联系仓库的管理员来获取权限。
 */


#import "MXSViewController.h"
#import <MXSKit.h>

@interface MXSViewController ()

@end

@implementation MXSViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    [MXSSingletonCmd.device sendStatusHeight];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
