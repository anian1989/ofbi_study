<#--
Licensed to the Apache Software Foundation (ASF) under one
or more contributor license agreements.  See the NOTICE file
distributed with this work for additional information
regarding copyright ownership.  The ASF licenses this file
to you under the Apache License, Version 2.0 (the
"License"); you may not use this file except in compliance
with the License.  You may obtain a copy of the License at

http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing,
software distributed under the License is distributed on an
"AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
KIND, either express or implied.  See the License for the
specific language governing permissions and limitations
under the License.
-->


  <div id="ecom-header">
  	<!-- 左半部分的logo -->
    <div id="left">
      <#if sessionAttributes.overrideLogo?exists>
        <img src="<@ofbizContentUrl>${sessionAttributes.overrideLogo}</@ofbizContentUrl>" alt="Logo"/>
      <#elseif catalogHeaderLogo?exists>
        <img src="<@ofbizContentUrl>${catalogHeaderLogo}</@ofbizContentUrl>" alt="Logo"/>
       <!--  主界面用的此处 在CommonScreens.xml的main-decorator中 getVisualThemeResources
       		时在表visual_theme_resource中配置
       	-->
      <#elseif layoutSettings.VT_HDR_IMAGE_URL?has_content>
        <img src="<@ofbizContentUrl>${layoutSettings.VT_HDR_IMAGE_URL.get(0)}</@ofbizContentUrl>" alt="Logo"/>
      </#if>
    </div>
    <div id="right">
      ${screens.render("component://ecommerce/widget/CartScreens.xml#microcart")}
    </div>
    <div id="middle">
      <#if !productStore?exists>
        <h2>${uiLabelMap.EcommerceNoProductStore}</h2>
      </#if>
      <#if (productStore.title)?exists><div id="company-name">${productStore.title}</div></#if>
      <#if (productStore.subtitle)?exists><div id="company-subtitle">${productStore.subtitle}</div></#if>
      <div id="welcome-message">
        <#if sessionAttributes.autoName?has_content>
          ${uiLabelMap.CommonWelcome}&nbsp;${sessionAttributes.autoName?html}!
          (${uiLabelMap.CommonNotYou}?&nbsp;<a href="<@ofbizUrl>autoLogout</@ofbizUrl>" class="linktext">${uiLabelMap.CommonClickHere}</a>)
        <#else/>
          ${uiLabelMap.CommonWelcome}!
        </#if>
      </div>
    </div>
  </div>

 <!-- 头部下放的工具条 -->
  <div id="ecom-header-bar">
    <ul id="left-links">
      <#if userLogin?has_content && userLogin.userLoginId != "anonymous">
      	<!-- CommonLogout属性在CommonUiLabels.xml定义，由main-decorator引入 -->
        <li id="header-bar-logout"><a href="<@ofbizUrl>logout</@ofbizUrl>">${uiLabelMap.CommonLogout}</a></li>
      <#else/>
      	<!-- CommonLogin属性在CommonUiLabels.xml定义，由main-decorator引入 -->
        <li id="header-bar-login"><a href="<@ofbizUrl>${checkLoginUrl}</@ofbizUrl>">${uiLabelMap.CommonLogin}</a></li>
      	<!-- EcommerceRegister属性在EcommerceUiLabels.xml定义，由main-decorator引入 -->
        <li id="header-bar-register"><a href="<@ofbizUrl>newcustomer</@ofbizUrl>">${uiLabelMap.EcommerceRegister}</a></li>
      </#if>
      <li id="header-bar-contactus">
        <#if userLogin?has_content && userLogin.userLoginId != "anonymous">
        	<!-- CommonContactUs属性在CommonUiLabels.xml定义，由main-decorator引入 -->
          <a href="<@ofbizUrl>contactus</@ofbizUrl>">${uiLabelMap.CommonContactUs}</a></li>
        <#else>
          <a href="<@ofbizUrl>AnonContactus</@ofbizUrl>">${uiLabelMap.CommonContactUs}</a></li>
        </#if>
        <!-- CommonMain属性在CommonUiLabels.xml定义，由main-decorator引入 -->
      <li id="header-bar-main"><a href="<@ofbizUrl>main</@ofbizUrl>">${uiLabelMap.CommonMain}</a></li>
    </ul>
    <ul id="right-links">
      <!-- NOTE: these are in reverse order because they are stacked right to left instead of left to right -->
      <#if !userLogin?has_content || (userLogin.userLoginId)?if_exists != "anonymous">
      	<!-- CommonMain属性在CommonUiLabels.xml定义，由main-decorator引入  简介 -->
        <li id="header-bar-viewprofile"><a href="<@ofbizUrl>viewprofile</@ofbizUrl>">${uiLabelMap.CommonProfile}</a></li>
      	<!-- CommonMain属性在CommonUiLabels.xml定义，由main-decorator引入  消息  -->
        <li id="header-bar-ListMessages"><a href="<@ofbizUrl>messagelist</@ofbizUrl>">${uiLabelMap.CommonMessages}</a></li>
      	<!-- CommonMain属性在OrderUiLabels.xml定义，由main-decorator引入  询价技能类型标识  -->
        <li id="header-bar-ListQuotes"><a href="<@ofbizUrl>ListQuotes</@ofbizUrl>">${uiLabelMap.OrderOrderQuotes}</a></li>
      	<!-- CommonMain属性在OrderUiLabels.xml定义，由main-decorator引入  请求  -->
        <li id="header-bar-ListRequests"><a href="<@ofbizUrl>ListRequests</@ofbizUrl>">${uiLabelMap.OrderRequests}</a></li>
      	<!-- CommonMain属性在EcommerceUiLabels.xml定义，由main-decorator引入  购物列表  -->
        <li id="header-bar-editShoppingList"><a href="<@ofbizUrl>editShoppingList</@ofbizUrl>">${uiLabelMap.EcommerceShoppingLists}</a></li>
      	<!-- CommonMain属性在EcommerceUiLabels.xml定义，由main-decorator引入 订单历史记录  -->
        <li id="header-bar-orderhistory"><a href="<@ofbizUrl>orderhistory</@ofbizUrl>">${uiLabelMap.EcommerceOrderHistory}</a></li>
      </#if>
      <#if catalogQuickaddUse>
      	<!-- CommonMain属性在CommonUiLabels.xml定义，由main-decorator引入  快速添加-->
        <li id="header-bar-quickadd"><a href="<@ofbizUrl>quickadd</@ofbizUrl>">${uiLabelMap.CommonQuickAdd}</a></li>
      </#if>
    </ul>
  </div>