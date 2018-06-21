*** Settings ***
Resource          基础关键字.robot

*** Keywords ***
登录
    [Arguments]    ${url}    ${browserType}    ${account}    ${password}
    打开浏览器    ${url}    ${browserType}
    进入登录窗口
    输入账号    ${account}
    输入密码    ${password}
    点击“登录”按钮

修改基础方案
    [Arguments]    ${plane}    ${styleColor}
    点击“修改基础方案”
    点击“平面方案 & 风格色系”    ${plane}    ${styleColor}
    点击“提交基础定制”按钮
    点击“确定修改”按钮
    点击“返回定制方案”按钮

查看基础定制订单状态
    [Arguments]    ${expectStatus}
    ${getStatus}=    获取基础定制订单状态
    Should Be Equal    ${getStatus}    ${expectStatus}

进入到选装定制页面
    点击“选装定制”按钮

添加部品到购物车
    [Arguments]    ${module}
    点击不同模块    ${module}
    添加模块下的第一个部品
    ${getPrice}=    获取部品的价格

添加部品配件到购物车
    [Arguments]    ${name}
    添加柜子的配件    ${name}

查看购物车列表
    [Arguments]    ${expectNumber}    ${expectPrice}
    点击购物车图标
    ${getNumber}=    获取购物车部品数量
    Should Be Equal    ${getNumber}    ${expectNumber}
    ${getTotalPrice}=    获取购物车总价
    Should Be Equal    ${getTotalPrice}    ${expectPrice}
    再次点击购物车图标

删除购物车中的部品
    点击购物车图标
    点击购物车部品删除图标
    再次点击购物车图标

提交选装定制到清单确认页
    [Arguments]    ${expectNumber}    ${expectPrice}
    点击“提交选装方案”按钮
    ${getNumber}=    获取部品总数量
    Should Be Equal    ${getNumber}    ${expectNumber}
    ${getTotalPrice}=    获取选装定制总价
    Should Be Equal    ${getTotalPrice}    ${expectPrice}

确认提交选装定制
    点击“提交选装方案”按钮（定制清单页）
    点击“查看选装订单”按钮

进入选装订单页
    [Arguments]    ${expectStatus}    ${expectPrice}
    ${getStatus}=    获取选装定制订单状态
    Should Be Equal    ${getStatus}    ${expectStatus}
    ${getTotalPrice}=    获取选装定制总价（选装订单页）
    Should Be Equal    ${getTotalPrice}    ${expectPrice}

进入定制方案卡片页
    [Arguments]    ${expectStatus}
    切换到“定制方案”tab
    ${getStatus}=    获取选装定制订单状态（卡片页）
    Should Be Equal    ${getStatus}    ${expectStatus}
