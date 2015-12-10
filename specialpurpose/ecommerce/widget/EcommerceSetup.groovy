/*
 * Licensed to the Apache Software Foundation (ASF) under one
 * or more contributor license agreements.  See the NOTICE file
 * distributed with this work for additional information
 * regarding copyright ownership.  The ASF licenses this file
 * to you under the Apache License, Version 2.0 (the
 * "License"); you may not use this file except in compliance
 * with the License.  You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing,
 * software distributed under the License is distributed on an
 * "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
 * KIND, either express or implied.  See the License for the
 * specific language governing permissions and limitations
 * under the License.
 */

import java.util.*;
import org.ofbiz.base.util.*;
import org.ofbiz.entity.*;
import org.ofbiz.product.catalog.CatalogWorker;
import org.ofbiz.product.store.ProductStoreWorker;
import org.ofbiz.common.CommonWorkers;
import org.ofbiz.order.shoppingcart.*;
import org.ofbiz.webapp.control.*;

productStore = ProductStoreWorker.getProductStore(request);//店铺

prodCatalog = CatalogWorker.getProdCatalog(request);//产品目录
if (prodCatalog) {
    catalogStyleSheet = prodCatalog.styleSheet;//样式表
    if (catalogStyleSheet) globalContext.catalogStyleSheet = catalogStyleSheet;
    catalogHeaderLogo = prodCatalog.headerLogo;//头logo
    if (catalogHeaderLogo) globalContext.catalogHeaderLogo = catalogHeaderLogo;
}

globalContext.productStore = productStore;
globalContext.checkLoginUrl = LoginWorker.makeLoginUrl(request, "checkLogin");//登录的URL
globalContext.catalogQuickaddUse = CatalogWorker.getCatalogQuickaddUse(request);//是否可快速添加，这个作用是什么呢？
