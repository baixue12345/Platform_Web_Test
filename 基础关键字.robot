*** Settings ***
Library           Selenium2Library
Library           DatabaseLibrary

*** Keywords ***
打开浏览器
    [Arguments]    ${url}    ${browserType}
    Open Browser    ${url}    ${browserType}
    Maximize Browser Window
    Sleep    3

进入登录窗口
    Click Element    xpath=//div[@class='jr-index-item']
    Sleep    3

输入账号
    [Arguments]    ${account}
    Input Text    id=account    ${account}

输入密码
    [Arguments]    ${password}
    Input Password    id=password    ${password}

点击“登录”按钮
    Click Button    xpath=//button[@class='jr-login-submit space-2']
    Sleep    3

点击“修改基础方案”
    Click Element    xpath=//a[@href='javascript:;']
    Sleep    3

点击“平面方案 & 风格色系”
    [Arguments]    ${plane}    ${styleColor}
    Click Element    xpath=//div[@title='${plane}']
    Sleep    3
    Click Element    xpath=//div[@title='${styleColor}']
    Sleep    3

点击“提交基础定制”按钮
    Click Button    xpath=//button[@class='jr-hfs-btn jr-hfs-return']
    Sleep    3

点击“确定修改”按钮
    Click Element    xpath=//div[@class='page-button primary']
    Sleep    3

点击“返回定制方案”按钮
    Click Element    xpath=//div[@class='page-button ghost']
    Sleep    3

获取基础定制订单状态
    Run Keyword And Return    Get Text    xpath=//span[@class='form-value orange']

点击“选装定制”按钮
    Click Element    xpath=//div[@class='page-button primary']
    Sleep    3

点击不同模块
    [Arguments]    ${module}
    Click Element    xpath=//div[contains(text(),'${module}')]
    Sleep    3

添加模块下的第一个部品
    Click Element    xpath=//div[@class='jr-relative jr-design-navpane-iteminfo-top']/div[@title='点击加入清单']
    Sleep    3

获取部品的价格
    Run Keyword And Return    Get Text    xpath=//div[@class='jr-relative jr-design-navpane-iteminfo-top']/div[@class='jr-design-navpane-iteminfo-price']/span

添加柜子的配件
    [Arguments]    ${name}
    Click Element    xpath=//img[@alt='${name}']
    Sleep    3

点击购物车图标
    Click Element    xpath=//div[@class='jr-design-cart-text']
    Sleep    3

获取购物车部品数量
    Run Keyword And Return    Get Text    xpath=//span[@class='jr-design-cart-num']

获取购物车总价
    Run Keyword And Return    Get Text    xpath=//span[@class='jr-design-cart-total']

点击购物车部品删除图标
    Click Element    xpath=//div[@class='item_compare_left checked']//i[@class='iconfont glodon-shanchu1']
    Sleep    3

再次点击购物车图标
    Click Element    xpath=//div[@class='jr-design-cart-text active']
    Sleep    3

点击“提交选装方案”按钮
    Click Button    xpath=//button[@class='jr-design-btn jr-design-return']
    Sleep    3

获取部品总数量
    Run Keyword And Return    Get Text    xpath=//div[@class='jr-order-footer']/span[@class='content-font'][1]

获取选装定制总价
    Run Keyword And Return    Get Text    xpath=//div[@class='jr-order-footer']/span[@class='content-font'][2]

点击“提交选装方案”按钮（定制清单页）
    Click Button    xpath=//button[@class='page-button primary']
    Sleep    3

点击“查看选装订单”按钮
    Click Button    xpath=//button[@class='page-button primary']
    Sleep    3

获取选装定制订单状态
    Run Keyword And Return    Get Text    xpath=//button[@style='width: 80px; height: 30px; font-size: 14px; margin-right: 30px; cursor: pointer;']

获取选装定制总价（选装订单页）
    Run Keyword And Return    Get Text    xpath=//span[@style='margin-right: 30px;']

切换到“定制方案”tab
    Click Element    xpath=//a[@class='jr-navbar-item']
    Sleep    3

获取选装定制订单状态（卡片页）
    Run Keyword And Return    Get Text    xpath=//div[@class='jr-house-info-item'][3]//span[@class='form-value orange']
