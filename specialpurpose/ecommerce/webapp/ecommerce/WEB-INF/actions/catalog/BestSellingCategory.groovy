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

import org.ofbiz.base.util.UtilValidate;
import org.ofbiz.base.util.UtilMisc;
import org.ofbiz.product.catalog.*;
import org.ofbiz.product.category.*;
import javolution.util.FastList;

catalogId = CatalogWorker.getCurrentCatalogId(request);
bestSellerCates = FastList.newInstance();//这个的源码 可以研究一下

if (UtilValidate.isNotEmpty(catalogId)) {
	//查询PROD_CATALOG_CATEGORY_TYPE_ID （产品目录分类类型） 为PCCT_BEST_SELL的 产品分类标示等信息
    prodCatalogCategoryList = CatalogWorker.getProdCatalogCategories(request, catalogId, "PCCT_BEST_SELL"); 
    if (prodCatalogCategoryList.size() > 0) {
        for (int i = 0; i < prodCatalogCategoryList.size(); i++) {
            prodCatalogCategory = prodCatalogCategoryList[i];
            productCategoryId = prodCatalogCategory.getString("productCategoryId");//产品分类标识 
            childCategoryList = CategoryWorker.getRelatedCategoriesRet(request, "childCategoryList", productCategoryId, true);
            if (childCategoryList.size() > 0) {
                bestSellerCates.add(childCategoryList);
            }
        }
    }
}

context.productCategoryList = bestSellerCates;
