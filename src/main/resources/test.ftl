<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Freemarker入门小DEMO</title>
</head>
<body>
<#--模板文件嵌套-->
<#include "head.ftl">
<#--我只是一个注释，我不会有任何输出  -->
${name},你好。${message}
<br><#--定义一个变量-->
<#assign linkman = '周先生'>
联系人：${linkman}
<br><#--定义对象类型-->
<#assign info={"mobile":"13312341234",'address':'北京市昌平区玉符街'}>
电话：${info.mobile}  地址：${info.address}
<br>
<#--if指令-->
<#if success==true>
    你已通过实名认证
<#else>
    你未通过认证
</#if>
<br>-----商品价格表------<br>
<#--list指令   如果想在循环中得到索引，使用循环变量+_index就可以得到。-->
<#list goodsList as goods>
    ${goods_index+1}商品名称：${goods.name} 价格：${goods.price}<br>
</#list>
<#--内建函数  变量+?+函数名称  size获取集合大小-->
共${goodsList?size}条记录<br>
<#--转换json字符串为对象-->
<#assign text="{'bank':'工商银行','account':'101010101010110'}"/>
<#assign data=text?eval/>
开户行：${data.bank} 账号：${data.account}
<br>
<#--日期格式化-->
当前日期：${today?date} <br>
当前时间：${today?time} <br>
当前日期+时间：${today?datetime} <br>
日期格式化：  ${today?string("yyyy年MM月dd日 HH时mm分ss秒")}
<br>
<#--数字转换为字符串,显示102,320,122 -->
累计积分：${point}<br>
累计积分：${point?c}
<br>
<#--空值处理运算符  若未对模板中变量赋值，生成时会抛异常，但对于有些变量确实是null的情况，做如下处理-->
<#--判断某变量是否存在:“??”-->
<#if aaa??>
  aaa变量存在
<#else>
  aaa变量不存在
</#if>
<br>
<#--缺失变量默认值:“!” 使用感叹号对未赋值的变量设置默认值例如这里设置为“-”-->
${aaa!'-'}
<br>


</body>
</html>