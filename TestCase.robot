*** Settings ***
Resource          业务关键字.robot

*** Test Cases ***
00-DeleteData（清理测试数据）
    Connect To Database Using Custom Params    pymysql    host='172.16.248.190',port=3306,user='admin',passwd='admin',db='bh_platform'
    Execute Sql Script    E:/BimHouse_Test/Platform_Web_Test/SQLScript.sql
    Disconnect From Database

01-Case1
    登录    http://172.16.248.192/    chrome    13525253535    123456
    修改基础方案    奢享四房    塞纳河畔
    查看基础定制订单状态    未签约
    进入到选装定制页面
    添加部品到购物车    风格色系
    添加部品到购物车    系统设备
    添加部品到购物车    厨卫配置
    添加部品到购物车    功能收纳
    添加部品配件到购物车    主卧衣柜一密码抽
    添加部品配件到购物车    主卧衣柜一除湿机
    添加部品配件到购物车    主卧衣柜一穿衣镜
    添加部品配件到购物车    主卧衣柜一裤架
    添加部品到购物车     功能配件
    查看购物车列表    9    24,850.00
    删除购物车中的部品
    查看购物车列表    8    24,700.00
    提交选装定制到清单确认页    总数量: 10    选装定制总价: 24,700元
     确认提交选装定制
    进入选装订单页    待付款    定制总价： 24,700 元
    进入定制方案卡片页    待付款
    [Teardown]    Close Browser
