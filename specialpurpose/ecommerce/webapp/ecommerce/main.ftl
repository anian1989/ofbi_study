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
<#-- 
关于screens对象在对应的handler的render方法中定义
如screen中
MacroScreenViewHandler的render方法
调用ScreenRenderer的populateContextForRequest方法
此方法调用this.populateBasicContext在context中放入screens
而screens对应的类是ScreenRenderer
-->
<#-- Render the category page -->
<#if requestAttributes.productCategoryId?has_content>
	<#-- 中间上部区域的列表  Popular Categories 销售最好的-->
  ${screens.render("component://ecommerce/widget/CatalogScreens.xml#bestSellingCategory")}
  <#-- 种类分类 Featured Products 部分的展示-->
  ${screens.render("component://ecommerce/widget/CatalogScreens.xml#category-include")}
<#else>
<#--没有找到促销分类——目录 -->
  <center><h2>${uiLabelMap.EcommerceNoPROMOTIONCategory}</h2></center>
</#if>
