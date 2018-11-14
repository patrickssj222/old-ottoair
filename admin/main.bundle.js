webpackJsonp(["main"],{

/***/ "./src/$$_lazy_route_resource lazy recursive":
/***/ (function(module, exports) {

function webpackEmptyAsyncContext(req) {
	// Here Promise.resolve().then() is used instead of new Promise() to prevent
	// uncatched exception popping up in devtools
	return Promise.resolve().then(function() {
		throw new Error("Cannot find module '" + req + "'.");
	});
}
webpackEmptyAsyncContext.keys = function() { return []; };
webpackEmptyAsyncContext.resolve = webpackEmptyAsyncContext;
module.exports = webpackEmptyAsyncContext;
webpackEmptyAsyncContext.id = "./src/$$_lazy_route_resource lazy recursive";

/***/ }),

/***/ "./src/app/app-router/app-router.module.ts":
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, "a", function() { return AppRouterModule; });
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_0__angular_core__ = __webpack_require__("./node_modules/@angular/core/esm5/core.js");
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_1__angular_router__ = __webpack_require__("./node_modules/@angular/router/esm5/router.js");
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_2__views_login_login_component__ = __webpack_require__("./src/app/views/login/login.component.ts");
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_3__views_home_home_component__ = __webpack_require__("./src/app/views/home/home.component.ts");
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_4__views_customers_customers_component__ = __webpack_require__("./src/app/views/customers/customers.component.ts");
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_5__views_flights_flights_component__ = __webpack_require__("./src/app/views/flights/flights.component.ts");
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_6__views_flights_flight_detail_flight_detail_component__ = __webpack_require__("./src/app/views/flights/flight-detail/flight-detail.component.ts");
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_7__views_orders_orders_component__ = __webpack_require__("./src/app/views/orders/orders.component.ts");
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_8__views_shipments_shipments_component__ = __webpack_require__("./src/app/views/shipments/shipments.component.ts");
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_9__views_shipments_shipment_detail_shipment_detail_component__ = __webpack_require__("./src/app/views/shipments/shipment-detail/shipment-detail.component.ts");
var __decorate = (this && this.__decorate) || function (decorators, target, key, desc) {
    var c = arguments.length, r = c < 3 ? target : desc === null ? desc = Object.getOwnPropertyDescriptor(target, key) : desc, d;
    if (typeof Reflect === "object" && typeof Reflect.decorate === "function") r = Reflect.decorate(decorators, target, key, desc);
    else for (var i = decorators.length - 1; i >= 0; i--) if (d = decorators[i]) r = (c < 3 ? d(r) : c > 3 ? d(target, key, r) : d(target, key)) || r;
    return c > 3 && r && Object.defineProperty(target, key, r), r;
};










// import { SidebarComponent } from '../views/sidebar/sidebar.component';
// let's set the main routes
var routes = [
    // this is the main screen after the app has been installed
    { path: '', component: __WEBPACK_IMPORTED_MODULE_3__views_home_home_component__["a" /* HomeComponent */] },
    { path: 'login', component: __WEBPACK_IMPORTED_MODULE_2__views_login_login_component__["a" /* LoginComponent */] },
    { path: 'customers', component: __WEBPACK_IMPORTED_MODULE_4__views_customers_customers_component__["a" /* CustomersComponent */] },
    { path: 'flights', component: __WEBPACK_IMPORTED_MODULE_5__views_flights_flights_component__["a" /* FlightsComponent */] },
    { path: 'flights/:id', component: __WEBPACK_IMPORTED_MODULE_6__views_flights_flight_detail_flight_detail_component__["a" /* FlightDetailComponent */] },
    { path: 'orders', component: __WEBPACK_IMPORTED_MODULE_7__views_orders_orders_component__["a" /* OrdersComponent */] },
    { path: 'shipments', component: __WEBPACK_IMPORTED_MODULE_8__views_shipments_shipments_component__["a" /* ShipmentsComponent */] },
    { path: 'shipments/:id', component: __WEBPACK_IMPORTED_MODULE_9__views_shipments_shipment_detail_shipment_detail_component__["a" /* ShipmentDetailComponent */] },
    // { path: 'sidebar', component: SidebarComponent },
    // fallback to a specific route
    { path: '**', redirectTo: '' }
];
var AppRouterModule = (function () {
    function AppRouterModule() {
    }
    AppRouterModule = __decorate([
        Object(__WEBPACK_IMPORTED_MODULE_0__angular_core__["K" /* NgModule */])({
            imports: [__WEBPACK_IMPORTED_MODULE_1__angular_router__["c" /* RouterModule */].forRoot(routes)],
            exports: [__WEBPACK_IMPORTED_MODULE_1__angular_router__["c" /* RouterModule */]]
        })
    ], AppRouterModule);
    return AppRouterModule;
}());



/***/ }),

/***/ "./src/app/app.component.css":
/***/ (function(module, exports) {

module.exports = "/* body {\r\n  margin:0 !important;\r\n} */\r\n\r\n.app-container {\r\n\theight: 100vh;\r\n\twidth: 100%;\r\n}\r\n"

/***/ }),

/***/ "./src/app/app.component.html":
/***/ (function(module, exports) {

module.exports = "<link href=\"https://fonts.googleapis.com/css?family=Montserrat\" rel=\"stylesheet\">\r\n\r\n<mat-sidenav-container class=\"app-container\">\r\n\t<mat-sidenav mode=\"side\" opened *ngIf=\"showNav\">\r\n\t\t<app-sidebar></app-sidebar>\r\n\t</mat-sidenav>\r\n\t<mat-sidenav-content>\r\n    <router-outlet></router-outlet>\r\n\t</mat-sidenav-content>\r\n</mat-sidenav-container>\r\n"

/***/ }),

/***/ "./src/app/app.component.ts":
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, "a", function() { return AppComponent; });
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_0__angular_core__ = __webpack_require__("./node_modules/@angular/core/esm5/core.js");
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_1_ngx_cookie_service__ = __webpack_require__("./node_modules/ngx-cookie-service/index.js");
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_2__angular_router__ = __webpack_require__("./node_modules/@angular/router/esm5/router.js");
var __decorate = (this && this.__decorate) || function (decorators, target, key, desc) {
    var c = arguments.length, r = c < 3 ? target : desc === null ? desc = Object.getOwnPropertyDescriptor(target, key) : desc, d;
    if (typeof Reflect === "object" && typeof Reflect.decorate === "function") r = Reflect.decorate(decorators, target, key, desc);
    else for (var i = decorators.length - 1; i >= 0; i--) if (d = decorators[i]) r = (c < 3 ? d(r) : c > 3 ? d(target, key, r) : d(target, key)) || r;
    return c > 3 && r && Object.defineProperty(target, key, r), r;
};
var __metadata = (this && this.__metadata) || function (k, v) {
    if (typeof Reflect === "object" && typeof Reflect.metadata === "function") return Reflect.metadata(k, v);
};



var AppComponent = (function () {
    function AppComponent(router, cookie) {
        this.router = router;
        this.cookie = cookie;
        this.title = 'OttoAir Admin';
    }
    AppComponent.prototype.ngOnInit = function () {
        this.pathname = window.location.href;
        var cookieExists = this.cookie.check('OTTO_ADMIN');
        if (cookieExists) {
            this.showNav = true;
        }
        else {
            this.showNav = false;
            if (this.pathname != '/login') {
                this.router.navigateByUrl('/login');
            }
        }
    };
    AppComponent = __decorate([
        Object(__WEBPACK_IMPORTED_MODULE_0__angular_core__["n" /* Component */])({
            selector: 'app-root',
            template: __webpack_require__("./src/app/app.component.html"),
            styles: [__webpack_require__("./src/app/app.component.css")]
        }),
        __metadata("design:paramtypes", [__WEBPACK_IMPORTED_MODULE_2__angular_router__["b" /* Router */],
            __WEBPACK_IMPORTED_MODULE_1_ngx_cookie_service__["a" /* CookieService */]])
    ], AppComponent);
    return AppComponent;
}());



/***/ }),

/***/ "./src/app/app.module.ts":
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, "a", function() { return AppModule; });
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_0__angular_platform_browser__ = __webpack_require__("./node_modules/@angular/platform-browser/esm5/platform-browser.js");
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_1__angular_core__ = __webpack_require__("./node_modules/@angular/core/esm5/core.js");
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_2__angular_forms__ = __webpack_require__("./node_modules/@angular/forms/esm5/forms.js");
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_3__angular_http__ = __webpack_require__("./node_modules/@angular/http/esm5/http.js");
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_4__angular_common_http__ = __webpack_require__("./node_modules/@angular/common/esm5/http.js");
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_5__app_component__ = __webpack_require__("./src/app/app.component.ts");
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_6__angular_platform_browser_animations__ = __webpack_require__("./node_modules/@angular/platform-browser/esm5/animations.js");
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_7__angular_material__ = __webpack_require__("./node_modules/@angular/material/esm5/material.es5.js");
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_8__angular_material_table__ = __webpack_require__("./node_modules/@angular/material/esm5/table.es5.js");
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_9__angular_cdk_table__ = __webpack_require__("./node_modules/@angular/cdk/esm5/table.es5.js");
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_10__angular_material_snack_bar__ = __webpack_require__("./node_modules/@angular/material/esm5/snack-bar.es5.js");
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_11__app_router_app_router_module__ = __webpack_require__("./src/app/app-router/app-router.module.ts");
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_12__angular_common__ = __webpack_require__("./node_modules/@angular/common/esm5/common.js");
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_13__services_connection_service__ = __webpack_require__("./src/app/services/connection.service.ts");
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_14__services_interceptor_service__ = __webpack_require__("./src/app/services/interceptor.service.ts");
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_15__common_notification_dialog_dialog_service__ = __webpack_require__("./src/app/common/notification/dialog/dialog.service.ts");
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_16__agm_core__ = __webpack_require__("./node_modules/@agm/core/index.js");
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_17_ngx_cookie_service__ = __webpack_require__("./node_modules/ngx-cookie-service/index.js");
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_18__views_home_home_component__ = __webpack_require__("./src/app/views/home/home.component.ts");
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_19__common_notification_dialog_dialog_component__ = __webpack_require__("./src/app/common/notification/dialog/dialog.component.ts");
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_20__common_forms_dynamic_form_dynamic_form_component__ = __webpack_require__("./src/app/common/forms/dynamic-form/dynamic-form.component.ts");
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_21__views_customers_customers_component__ = __webpack_require__("./src/app/views/customers/customers.component.ts");
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_22__views_flights_flights_component__ = __webpack_require__("./src/app/views/flights/flights.component.ts");
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_23__views_orders_orders_component__ = __webpack_require__("./src/app/views/orders/orders.component.ts");
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_24__views_shipments_shipments_component__ = __webpack_require__("./src/app/views/shipments/shipments.component.ts");
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_25__views_sidebar_sidebar_component__ = __webpack_require__("./src/app/views/sidebar/sidebar.component.ts");
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_26__views_shipments_shipment_detail_shipment_detail_component__ = __webpack_require__("./src/app/views/shipments/shipment-detail/shipment-detail.component.ts");
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_27__views_login_login_component__ = __webpack_require__("./src/app/views/login/login.component.ts");
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_28__views_flights_flight_detail_flight_detail_component__ = __webpack_require__("./src/app/views/flights/flight-detail/flight-detail.component.ts");
var __decorate = (this && this.__decorate) || function (decorators, target, key, desc) {
    var c = arguments.length, r = c < 3 ? target : desc === null ? desc = Object.getOwnPropertyDescriptor(target, key) : desc, d;
    if (typeof Reflect === "object" && typeof Reflect.decorate === "function") r = Reflect.decorate(decorators, target, key, desc);
    else for (var i = decorators.length - 1; i >= 0; i--) if (d = decorators[i]) r = (c < 3 ? d(r) : c > 3 ? d(target, key, r) : d(target, key)) || r;
    return c > 3 && r && Object.defineProperty(target, key, r), r;
};







// material components





// router


//services





// app sections











var AppModule = (function () {
    function AppModule() {
    }
    AppModule = __decorate([
        Object(__WEBPACK_IMPORTED_MODULE_1__angular_core__["K" /* NgModule */])({
            declarations: [
                __WEBPACK_IMPORTED_MODULE_5__app_component__["a" /* AppComponent */],
                __WEBPACK_IMPORTED_MODULE_18__views_home_home_component__["a" /* HomeComponent */],
                __WEBPACK_IMPORTED_MODULE_19__common_notification_dialog_dialog_component__["a" /* DialogComponent */],
                __WEBPACK_IMPORTED_MODULE_20__common_forms_dynamic_form_dynamic_form_component__["a" /* DynamicFormComponent */],
                __WEBPACK_IMPORTED_MODULE_21__views_customers_customers_component__["a" /* CustomersComponent */],
                __WEBPACK_IMPORTED_MODULE_22__views_flights_flights_component__["a" /* FlightsComponent */],
                __WEBPACK_IMPORTED_MODULE_23__views_orders_orders_component__["a" /* OrdersComponent */],
                __WEBPACK_IMPORTED_MODULE_24__views_shipments_shipments_component__["a" /* ShipmentsComponent */],
                __WEBPACK_IMPORTED_MODULE_25__views_sidebar_sidebar_component__["a" /* SidebarComponent */],
                __WEBPACK_IMPORTED_MODULE_26__views_shipments_shipment_detail_shipment_detail_component__["a" /* ShipmentDetailComponent */],
                __WEBPACK_IMPORTED_MODULE_27__views_login_login_component__["a" /* LoginComponent */],
                __WEBPACK_IMPORTED_MODULE_28__views_flights_flight_detail_flight_detail_component__["a" /* FlightDetailComponent */]
            ],
            imports: [
                __WEBPACK_IMPORTED_MODULE_0__angular_platform_browser__["a" /* BrowserModule */],
                __WEBPACK_IMPORTED_MODULE_11__app_router_app_router_module__["a" /* AppRouterModule */],
                __WEBPACK_IMPORTED_MODULE_2__angular_forms__["d" /* FormsModule */],
                __WEBPACK_IMPORTED_MODULE_3__angular_http__["b" /* HttpModule */],
                __WEBPACK_IMPORTED_MODULE_4__angular_common_http__["c" /* HttpClientModule */],
                __WEBPACK_IMPORTED_MODULE_6__angular_platform_browser_animations__["a" /* BrowserAnimationsModule */],
                __WEBPACK_IMPORTED_MODULE_7__angular_material__["x" /* MatToolbarModule */],
                __WEBPACK_IMPORTED_MODULE_7__angular_material__["s" /* MatSidenavModule */],
                __WEBPACK_IMPORTED_MODULE_7__angular_material__["k" /* MatIconModule */],
                __WEBPACK_IMPORTED_MODULE_7__angular_material__["o" /* MatProgressBarModule */],
                __WEBPACK_IMPORTED_MODULE_7__angular_material__["n" /* MatPaginatorModule */],
                __WEBPACK_IMPORTED_MODULE_7__angular_material__["b" /* MatButtonModule */],
                __WEBPACK_IMPORTED_MODULE_7__angular_material__["m" /* MatListModule */],
                __WEBPACK_IMPORTED_MODULE_7__angular_material__["c" /* MatCardModule */],
                __WEBPACK_IMPORTED_MODULE_7__angular_material__["w" /* MatTabsModule */],
                __WEBPACK_IMPORTED_MODULE_10__angular_material_snack_bar__["b" /* MatSnackBarModule */],
                __WEBPACK_IMPORTED_MODULE_7__angular_material__["i" /* MatFormFieldModule */],
                __WEBPACK_IMPORTED_MODULE_7__angular_material__["l" /* MatInputModule */],
                __WEBPACK_IMPORTED_MODULE_7__angular_material__["j" /* MatGridListModule */],
                __WEBPACK_IMPORTED_MODULE_7__angular_material__["p" /* MatProgressSpinnerModule */],
                __WEBPACK_IMPORTED_MODULE_8__angular_material_table__["b" /* MatTableModule */],
                __WEBPACK_IMPORTED_MODULE_9__angular_cdk_table__["m" /* CdkTableModule */],
                __WEBPACK_IMPORTED_MODULE_2__angular_forms__["i" /* ReactiveFormsModule */],
                __WEBPACK_IMPORTED_MODULE_7__angular_material__["t" /* MatSlideToggleModule */],
                __WEBPACK_IMPORTED_MODULE_7__angular_material__["r" /* MatSelectModule */],
                __WEBPACK_IMPORTED_MODULE_7__angular_material__["h" /* MatExpansionModule */],
                __WEBPACK_IMPORTED_MODULE_7__angular_material__["d" /* MatCheckboxModule */],
                __WEBPACK_IMPORTED_MODULE_7__angular_material__["q" /* MatRadioModule */],
                __WEBPACK_IMPORTED_MODULE_7__angular_material__["y" /* MatTooltipModule */],
                __WEBPACK_IMPORTED_MODULE_7__angular_material__["f" /* MatDialogModule */],
                __WEBPACK_IMPORTED_MODULE_16__agm_core__["a" /* AgmCoreModule */].forRoot({
                    apiKey: 'AIzaSyAnsr-uSrhCSfnLXOrADz9cv9ATXiLazKU',
                    apiVersion: "4"
                })
            ],
            providers: [__WEBPACK_IMPORTED_MODULE_13__services_connection_service__["a" /* ConnectionService */],
                __WEBPACK_IMPORTED_MODULE_17_ngx_cookie_service__["a" /* CookieService */],
                __WEBPACK_IMPORTED_MODULE_15__common_notification_dialog_dialog_service__["a" /* DialogService */],
                { provide: __WEBPACK_IMPORTED_MODULE_4__angular_common_http__["a" /* HTTP_INTERCEPTORS */], useClass: __WEBPACK_IMPORTED_MODULE_14__services_interceptor_service__["a" /* InterceptorService */], multi: true },
                { provide: __WEBPACK_IMPORTED_MODULE_12__angular_common__["g" /* LocationStrategy */], useClass: __WEBPACK_IMPORTED_MODULE_12__angular_common__["d" /* HashLocationStrategy */] }
            ],
            bootstrap: [__WEBPACK_IMPORTED_MODULE_5__app_component__["a" /* AppComponent */]],
            entryComponents: [__WEBPACK_IMPORTED_MODULE_19__common_notification_dialog_dialog_component__["a" /* DialogComponent */]]
        })
    ], AppModule);
    return AppModule;
}());



/***/ }),

/***/ "./src/app/common/forms/dynamic-form.service.ts":
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, "a", function() { return DynamicFormService; });
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_0__angular_core__ = __webpack_require__("./node_modules/@angular/core/esm5/core.js");
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_1__angular_forms__ = __webpack_require__("./node_modules/@angular/forms/esm5/forms.js");
var __decorate = (this && this.__decorate) || function (decorators, target, key, desc) {
    var c = arguments.length, r = c < 3 ? target : desc === null ? desc = Object.getOwnPropertyDescriptor(target, key) : desc, d;
    if (typeof Reflect === "object" && typeof Reflect.decorate === "function") r = Reflect.decorate(decorators, target, key, desc);
    else for (var i = decorators.length - 1; i >= 0; i--) if (d = decorators[i]) r = (c < 3 ? d(r) : c > 3 ? d(target, key, r) : d(target, key)) || r;
    return c > 3 && r && Object.defineProperty(target, key, r), r;
};
var __metadata = (this && this.__metadata) || function (k, v) {
    if (typeof Reflect === "object" && typeof Reflect.metadata === "function") return Reflect.metadata(k, v);
};


var DynamicFormService = (function () {
    function DynamicFormService(fb) {
        this.fb = fb;
        this.inputs = {};
        this.values = false;
        this.existingform = false;
        this.multiform = false;
        this.multiformName = false;
    }
    DynamicFormService.prototype.setValue = function (s, value) {
        this[s] = value;
    };
    DynamicFormService.prototype.createForm = function (fields, values) {
        var inputs = {};
        if (values) {
            for (var v = 0; v < fields.length; v++) {
                var val = fields[v];
                for (var i in values) {
                    if (i == val.field) {
                        val.value = values[i];
                    }
                }
            }
        }
        for (var f = 0; f < fields.length; f++) {
            var value = '';
            if (fields[f].value) {
                value = fields[f].value;
            }
            if (fields[f].validator) {
                inputs[fields[f].field] = [value, fields[f].validator];
            }
            else {
                inputs[fields[f].field] = [value];
            }
        }
        return this.fb.group(inputs);
    };
    DynamicFormService.prototype.createMultiform = function (formName, values, multiform) {
        var fields = multiform[formName];
        var inputs = {};
        var first = true;
        if (values) {
            for (var v = 0; v < fields.length; v++) {
                var val = fields[v];
                for (var i in values) {
                    if (i == val.field) {
                        val.value = values[i];
                    }
                }
            }
        }
        for (var f = 0; f < fields.length; f++) {
            var value = '';
            if (fields[f].value) {
                value = fields[f].value;
            }
            if (fields[f].fgroup) {
                inputs[fields[f].field] = this.fb.array([]);
                if (values[fields[f].fgroupValues]) {
                    for (var s = 0; s < values[fields[f].fgroupValues].length; s++) {
                        var sub = values[fields[f].fgroupValues][s];
                        inputs[fields[f].field].push(this.createMultiform(fields[f].fgroup, sub, multiform));
                    }
                }
            }
            else {
                if (fields[f].validator) {
                    inputs[fields[f].field] = [value, fields[f].validator];
                }
                else {
                    inputs[fields[f].field] = [value, __WEBPACK_IMPORTED_MODULE_1__angular_forms__["j" /* Validators */].required];
                }
            }
        }
        return this.fb.group(inputs);
    };
    DynamicFormService = __decorate([
        Object(__WEBPACK_IMPORTED_MODULE_0__angular_core__["C" /* Injectable */])(),
        __metadata("design:paramtypes", [__WEBPACK_IMPORTED_MODULE_1__angular_forms__["b" /* FormBuilder */]])
    ], DynamicFormService);
    return DynamicFormService;
}());



/***/ }),

/***/ "./src/app/common/forms/dynamic-form/dynamic-form.component.html":
/***/ (function(module, exports) {

module.exports = "<div [formGroup]=\"form\" class=\"dynamic-form form\">\r\n    <div class=\"input-container\" *ngFor=\"let input of inputs\" [ngSwitch]=\"input.type\" [ngClass]=\"input.size_class\">\r\n        <!-- text input type -->\r\n        <mat-form-field class=\"input-field\" *ngSwitchCase=\"'text'\">\r\n            <input matInput [placeholder]=\"input.name\" [type]=\"input.type\" [formControlName]=\"input.field\" (change)=\"checkDepend(input.field)\">\r\n        </mat-form-field>\r\n\r\n        <!-- select input type -->\r\n        <mat-form-field *ngSwitchCase=\"'select'\" class=\"input-field\">\r\n            <mat-select [placeholder]=\"input.name\" [formControlName]=\"input.field\" (change)=\"checkDepend(input.field)\">\r\n                <mat-option *ngFor=\"let option of selectOptions[input.options]\" [value]=\"option.value\">{{ option.name }}</mat-option>\r\n            </mat-select>\r\n        </mat-form-field>\r\n    </div>\r\n</div>"

/***/ }),

/***/ "./src/app/common/forms/dynamic-form/dynamic-form.component.scss":
/***/ (function(module, exports) {

module.exports = ""

/***/ }),

/***/ "./src/app/common/forms/dynamic-form/dynamic-form.component.ts":
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, "a", function() { return DynamicFormComponent; });
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_0__angular_core__ = __webpack_require__("./node_modules/@angular/core/esm5/core.js");
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_1__angular_forms__ = __webpack_require__("./node_modules/@angular/forms/esm5/forms.js");
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_2__dynamic_form_service__ = __webpack_require__("./src/app/common/forms/dynamic-form.service.ts");
var __decorate = (this && this.__decorate) || function (decorators, target, key, desc) {
    var c = arguments.length, r = c < 3 ? target : desc === null ? desc = Object.getOwnPropertyDescriptor(target, key) : desc, d;
    if (typeof Reflect === "object" && typeof Reflect.decorate === "function") r = Reflect.decorate(decorators, target, key, desc);
    else for (var i = decorators.length - 1; i >= 0; i--) if (d = decorators[i]) r = (c < 3 ? d(r) : c > 3 ? d(target, key, r) : d(target, key)) || r;
    return c > 3 && r && Object.defineProperty(target, key, r), r;
};
var __metadata = (this && this.__metadata) || function (k, v) {
    if (typeof Reflect === "object" && typeof Reflect.metadata === "function") return Reflect.metadata(k, v);
};



var DynamicFormComponent = (function () {
    function DynamicFormComponent(fb, dfs) {
        this.fb = fb;
        this.dfs = dfs;
        this.inputs = {};
        this.values = false;
        this.formChange = new __WEBPACK_IMPORTED_MODULE_0__angular_core__["x" /* EventEmitter */]();
        this.existingform = false;
        this.multiform = false;
        this.multiformName = false;
        this.selectOptions = {};
    }
    DynamicFormComponent.prototype.ngOnInit = function () {
        var _this = this;
        if (this.existingform) {
            this.form = this.existingform;
        }
        else {
            if (this.multiform) {
                this.form = this.dfs.createMultiform(this.multiformName, this.values, this.multiform);
            }
            else {
                this.form = this.dfs.createForm(this.inputs, this.values);
            }
            this.form.valueChanges.subscribe(function (form) {
                _this.formChange.emit(form);
            });
        }
        this.formChange.emit(this.form);
    };
    DynamicFormComponent.prototype.checkDepend = function (field) {
        this.formChange.emit(this.form);
    };
    __decorate([
        Object(__WEBPACK_IMPORTED_MODULE_0__angular_core__["F" /* Input */])(),
        __metadata("design:type", Object)
    ], DynamicFormComponent.prototype, "inputs", void 0);
    __decorate([
        Object(__WEBPACK_IMPORTED_MODULE_0__angular_core__["F" /* Input */])(),
        __metadata("design:type", Object)
    ], DynamicFormComponent.prototype, "values", void 0);
    __decorate([
        Object(__WEBPACK_IMPORTED_MODULE_0__angular_core__["R" /* Output */])('form'),
        __metadata("design:type", __WEBPACK_IMPORTED_MODULE_0__angular_core__["x" /* EventEmitter */])
    ], DynamicFormComponent.prototype, "formChange", void 0);
    __decorate([
        Object(__WEBPACK_IMPORTED_MODULE_0__angular_core__["F" /* Input */])(),
        __metadata("design:type", Object)
    ], DynamicFormComponent.prototype, "existingform", void 0);
    __decorate([
        Object(__WEBPACK_IMPORTED_MODULE_0__angular_core__["F" /* Input */])(),
        __metadata("design:type", Object)
    ], DynamicFormComponent.prototype, "multiform", void 0);
    __decorate([
        Object(__WEBPACK_IMPORTED_MODULE_0__angular_core__["F" /* Input */])(),
        __metadata("design:type", Object)
    ], DynamicFormComponent.prototype, "multiformName", void 0);
    __decorate([
        Object(__WEBPACK_IMPORTED_MODULE_0__angular_core__["F" /* Input */])(),
        __metadata("design:type", Object)
    ], DynamicFormComponent.prototype, "selectOptions", void 0);
    DynamicFormComponent = __decorate([
        Object(__WEBPACK_IMPORTED_MODULE_0__angular_core__["n" /* Component */])({
            selector: 'dynamic-form',
            template: __webpack_require__("./src/app/common/forms/dynamic-form/dynamic-form.component.html"),
            styles: [__webpack_require__("./src/app/common/forms/dynamic-form/dynamic-form.component.scss")],
            encapsulation: __WEBPACK_IMPORTED_MODULE_0__angular_core__["_14" /* ViewEncapsulation */].None
        }),
        __metadata("design:paramtypes", [__WEBPACK_IMPORTED_MODULE_1__angular_forms__["b" /* FormBuilder */],
            __WEBPACK_IMPORTED_MODULE_2__dynamic_form_service__["a" /* DynamicFormService */]])
    ], DynamicFormComponent);
    return DynamicFormComponent;
}());



/***/ }),

/***/ "./src/app/common/notification/dialog/dialog.component.html":
/***/ (function(module, exports) {

module.exports = "<div class=\"notification-message\">\r\n    <h2 [innerHTML]=\"title\"></h2>\r\n    <p [innerHTML]=\"message\"></p>\r\n    <div class=\"actions\">\r\n        <button mat-button (click)=\"close(true)\">{{ yes }}</button>\r\n        <button mat-button (click)=\"close(false)\" *ngIf=\"no\">{{ no }}</button>\r\n    </div>\r\n</div>"

/***/ }),

/***/ "./src/app/common/notification/dialog/dialog.component.scss":
/***/ (function(module, exports) {

module.exports = ".notification-message h2 {\n  margin: 0; }\n\n.notification-message p {\n  max-width: 330px; }\n\n.notification-message .actions {\n  display: -webkit-box;\n  display: -ms-flexbox;\n  display: flex;\n  -ms-flex-pack: distribute;\n      justify-content: space-around; }\n\n.notification-message .actions button {\n    border-radius: 0;\n    border: 1px solid #000 !important; }\n"

/***/ }),

/***/ "./src/app/common/notification/dialog/dialog.component.ts":
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, "a", function() { return DialogComponent; });
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_0__angular_core__ = __webpack_require__("./node_modules/@angular/core/esm5/core.js");
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_1__angular_material__ = __webpack_require__("./node_modules/@angular/material/esm5/material.es5.js");
var __decorate = (this && this.__decorate) || function (decorators, target, key, desc) {
    var c = arguments.length, r = c < 3 ? target : desc === null ? desc = Object.getOwnPropertyDescriptor(target, key) : desc, d;
    if (typeof Reflect === "object" && typeof Reflect.decorate === "function") r = Reflect.decorate(decorators, target, key, desc);
    else for (var i = decorators.length - 1; i >= 0; i--) if (d = decorators[i]) r = (c < 3 ? d(r) : c > 3 ? d(target, key, r) : d(target, key)) || r;
    return c > 3 && r && Object.defineProperty(target, key, r), r;
};
var __metadata = (this && this.__metadata) || function (k, v) {
    if (typeof Reflect === "object" && typeof Reflect.metadata === "function") return Reflect.metadata(k, v);
};
var __param = (this && this.__param) || function (paramIndex, decorator) {
    return function (target, key) { decorator(target, key, paramIndex); }
};


var DialogComponent = (function () {
    function DialogComponent(data, dialogRef) {
        this.data = data;
        this.dialogRef = dialogRef;
        this.title = 'Notification!';
        this.message = '';
        this.yes = "Ok";
        this.no = false;
        this.title = this.data.title;
        this.message = this.data.message;
        if (this.data.yes)
            this.yes = this.data.yes;
        if (this.data.no)
            this.no = this.data.no;
    }
    DialogComponent.prototype.ngOnInit = function () {
    };
    DialogComponent.prototype.close = function (response) {
        this.dialogRef.close(response);
    };
    DialogComponent = __decorate([
        Object(__WEBPACK_IMPORTED_MODULE_0__angular_core__["n" /* Component */])({
            selector: 'app-dialog',
            template: __webpack_require__("./src/app/common/notification/dialog/dialog.component.html"),
            styles: [__webpack_require__("./src/app/common/notification/dialog/dialog.component.scss")]
        }),
        __param(0, Object(__WEBPACK_IMPORTED_MODULE_0__angular_core__["B" /* Inject */])(__WEBPACK_IMPORTED_MODULE_1__angular_material__["a" /* MAT_DIALOG_DATA */])),
        __metadata("design:paramtypes", [Object, __WEBPACK_IMPORTED_MODULE_1__angular_material__["g" /* MatDialogRef */]])
    ], DialogComponent);
    return DialogComponent;
}());



/***/ }),

/***/ "./src/app/common/notification/dialog/dialog.service.ts":
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, "a", function() { return DialogService; });
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_0__angular_core__ = __webpack_require__("./node_modules/@angular/core/esm5/core.js");
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_1__dialog_component__ = __webpack_require__("./src/app/common/notification/dialog/dialog.component.ts");
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_2__angular_material__ = __webpack_require__("./node_modules/@angular/material/esm5/material.es5.js");
var __decorate = (this && this.__decorate) || function (decorators, target, key, desc) {
    var c = arguments.length, r = c < 3 ? target : desc === null ? desc = Object.getOwnPropertyDescriptor(target, key) : desc, d;
    if (typeof Reflect === "object" && typeof Reflect.decorate === "function") r = Reflect.decorate(decorators, target, key, desc);
    else for (var i = decorators.length - 1; i >= 0; i--) if (d = decorators[i]) r = (c < 3 ? d(r) : c > 3 ? d(target, key, r) : d(target, key)) || r;
    return c > 3 && r && Object.defineProperty(target, key, r), r;
};
var __metadata = (this && this.__metadata) || function (k, v) {
    if (typeof Reflect === "object" && typeof Reflect.metadata === "function") return Reflect.metadata(k, v);
};



var DialogService = (function () {
    function DialogService(dialog) {
        this.dialog = dialog;
    }
    DialogService.prototype.showDialogError = function (title, message) {
        var dialogRef = this.dialog.open(__WEBPACK_IMPORTED_MODULE_1__dialog_component__["a" /* DialogComponent */], {
            data: {
                title: title,
                message: message,
                yes: false,
                no: false
            }
        });
    };
    DialogService.prototype.showConfirmationdialog = function (title, message, yes, no) {
        var dialogRef = this.dialog.open(__WEBPACK_IMPORTED_MODULE_1__dialog_component__["a" /* DialogComponent */], {
            data: {
                title: title,
                message: message,
                yes: yes,
                no: no
            }
        });
        return dialogRef.afterClosed();
    };
    DialogService.prototype.customDialog = function (component, data) {
        var dialogRef = this.dialog.open(component, {
            data: data
        });
        return dialogRef.afterClosed();
    };
    DialogService = __decorate([
        Object(__WEBPACK_IMPORTED_MODULE_0__angular_core__["C" /* Injectable */])(),
        __metadata("design:paramtypes", [__WEBPACK_IMPORTED_MODULE_2__angular_material__["e" /* MatDialog */]])
    ], DialogService);
    return DialogService;
}());



/***/ }),

/***/ "./src/app/services/connection.service.ts":
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, "a", function() { return ConnectionService; });
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_0__angular_core__ = __webpack_require__("./node_modules/@angular/core/esm5/core.js");
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_1__angular_common_http__ = __webpack_require__("./node_modules/@angular/common/esm5/http.js");
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_2__angular_http__ = __webpack_require__("./node_modules/@angular/http/esm5/http.js");
var __decorate = (this && this.__decorate) || function (decorators, target, key, desc) {
    var c = arguments.length, r = c < 3 ? target : desc === null ? desc = Object.getOwnPropertyDescriptor(target, key) : desc, d;
    if (typeof Reflect === "object" && typeof Reflect.decorate === "function") r = Reflect.decorate(decorators, target, key, desc);
    else for (var i = decorators.length - 1; i >= 0; i--) if (d = decorators[i]) r = (c < 3 ? d(r) : c > 3 ? d(target, key, r) : d(target, key)) || r;
    return c > 3 && r && Object.defineProperty(target, key, r), r;
};
var __metadata = (this && this.__metadata) || function (k, v) {
    if (typeof Reflect === "object" && typeof Reflect.metadata === "function") return Reflect.metadata(k, v);
};



var ConnectionService = (function () {
    function ConnectionService(client, http) {
        this.client = client;
        this.http = http;
        this.headers = false;
        this.headers = new __WEBPACK_IMPORTED_MODULE_1__angular_common_http__["d" /* HttpHeaders */]()
            .set('Content-Type', 'application/json');
    }
    ConnectionService.prototype.get = function (url) {
        return this.client.get(url);
    };
    ConnectionService.prototype.getContent = function (url) {
        return this.client.get(url, { responseType: 'text' });
    };
    ConnectionService.prototype.post = function (url, query, file) {
        // let params = new HttpParams();
        // params = this.parseParams(params, query, []);
        // return this.client.post(url, params, this.headers);
        return this.client.post(url, query, this.headers);
    };
    ConnectionService.prototype.serialize = function (query, prefix) {
        var str = [];
        for (var p in query) {
            if (query.hasOwnProperty(p)) {
                var k = prefix ? prefix + "[" + p + "]" : p, v = query[p];
                str.push((v !== null && typeof v === "object") ?
                    this.serialize(v, k) :
                    k + "=" + encodeURIComponent(v));
            }
        }
        return str.join("&");
    };
    ConnectionService.prototype.parseParams = function (params, query, depth) {
        for (var q in query) {
            if (typeof query[q] === 'object') {
                var newDepth = [];
                for (var d = 0; d < depth.length; d++) {
                    newDepth.push(depth[d]);
                }
                newDepth.push(q);
                params = this.parseParams(params, query[q], newDepth);
            }
            else {
                var s = q;
                for (var d = 0; d < depth.length; d++) {
                    if (d > 0) {
                        s += '[' + depth[d] + ']';
                    }
                    else {
                        s = depth[d];
                    }
                    if (d === depth.length - 1) {
                        s += '[' + q + ']';
                    }
                }
                params = params.append(s, query[q]);
            }
        }
        return params;
    };
    ConnectionService.prototype.parseQuery = function (formData, query, depth) {
        for (var q in query) {
            if (typeof query[q] === 'object') {
                depth.push(q);
                formData = this.parseQuery(formData, query[q], depth);
            }
            else {
                var s = q;
                for (var d = 0; d < depth.length; d++) {
                    if (d > 0) {
                        s += '[' + depth[d] + ']';
                    }
                    else {
                        s = depth[d];
                    }
                    if (d === depth.length - 1) {
                        s += '[' + q + ']';
                    }
                }
                formData.append(s, query[q]);
            }
        }
        return formData;
    };
    ConnectionService = __decorate([
        Object(__WEBPACK_IMPORTED_MODULE_0__angular_core__["C" /* Injectable */])(),
        __metadata("design:paramtypes", [__WEBPACK_IMPORTED_MODULE_1__angular_common_http__["b" /* HttpClient */],
            __WEBPACK_IMPORTED_MODULE_2__angular_http__["a" /* Http */]])
    ], ConnectionService);
    return ConnectionService;
}());



/***/ }),

/***/ "./src/app/services/interceptor.service.ts":
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, "a", function() { return InterceptorService; });
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_0__angular_core__ = __webpack_require__("./node_modules/@angular/core/esm5/core.js");
var __decorate = (this && this.__decorate) || function (decorators, target, key, desc) {
    var c = arguments.length, r = c < 3 ? target : desc === null ? desc = Object.getOwnPropertyDescriptor(target, key) : desc, d;
    if (typeof Reflect === "object" && typeof Reflect.decorate === "function") r = Reflect.decorate(decorators, target, key, desc);
    else for (var i = decorators.length - 1; i >= 0; i--) if (d = decorators[i]) r = (c < 3 ? d(r) : c > 3 ? d(target, key, r) : d(target, key)) || r;
    return c > 3 && r && Object.defineProperty(target, key, r), r;
};

var InterceptorService = (function () {
    function InterceptorService() {
    }
    InterceptorService.prototype.intercept = function (req, next) {
        if (req.url.indexOf(window.otto_data) > -1) {
            // Append token for reques to save and get data through ribon database
            var dupReq = req.clone({ headers: req.headers.set('token', window.otto_token) });
            return next.handle(dupReq);
        }
        else {
            return next.handle(req);
        }
    };
    InterceptorService = __decorate([
        Object(__WEBPACK_IMPORTED_MODULE_0__angular_core__["C" /* Injectable */])()
    ], InterceptorService);
    return InterceptorService;
}());



/***/ }),

/***/ "./src/app/views/customers/customers.component.html":
/***/ (function(module, exports) {

module.exports = "<div class=\"content-container\">\r\n  <mat-toolbar class=\"admin-toolbar\">\r\n    <span>Customers</span>\r\n  </mat-toolbar>\r\n  <div class=\"customer-list\">\r\n    <mat-table #table [dataSource]=\"dataSource\">\r\n      <ng-container matColumnDef=\"id\">\r\n        <mat-header-cell *matHeaderCellDef> ID </mat-header-cell>\r\n        <!-- <mat-cell *matCellDef=\"let customer\"> {{customer.user_id}} </mat-cell> -->\r\n      </ng-container>\r\n\r\n      <ng-container matColumnDef=\"name\">\r\n        <mat-header-cell *matHeaderCellDef> Name </mat-header-cell>\r\n        <!-- <mat-cell *matCellDef=\"let customer\"> {{customer.firstname}} {{customer.lastname}} </mat-cell> -->\r\n      </ng-container>\r\n\r\n      <ng-container matColumnDef=\"phone\">\r\n        <mat-header-cell *matHeaderCellDef> Phone </mat-header-cell>\r\n        <!-- <mat-cell *matCellDef=\"let customer\"> {{customer.phone}} </mat-cell> -->\r\n      </ng-container>\r\n\r\n      <ng-container matColumnDef=\"email\">\r\n        <mat-header-cell *matHeaderCellDef> Email </mat-header-cell>\r\n        <!-- <mat-cell *matCellDef=\"let customer\"> {{customer.email}} </mat-cell> -->\r\n      </ng-container>\r\n\r\n      <ng-container matColumnDef=\"wechat\">\r\n        <mat-header-cell *matHeaderCellDef> WeChat </mat-header-cell>\r\n        <!-- <mat-cell *matCellDef=\"let customer\"> {{customer.email}} </mat-cell> -->\r\n      </ng-container>\r\n\r\n      <ng-container matColumnDef=\"region\">\r\n        <mat-header-cell *matHeaderCellDef> Region </mat-header-cell>\r\n        <!-- <mat-cell *matCellDef=\"let customer\"> {{customer.region}} </mat-cell> -->\r\n      </ng-container>\r\n\r\n      <mat-header-row *matHeaderRowDef=\"displayedColumns\"></mat-header-row>\r\n      <mat-row *matRowDef=\"let row; columns: displayedColumns;\"></mat-row>\r\n    </mat-table>\r\n  </div>\r\n</div>\r\n\r\n\r\n<mat-accordion>\r\n  <mat-expansion-panel (opened)=\"panelOpenState = true\"\r\n                       (closed)=\"panelOpenState = false\"\r\n                       *ngFor=\"let customer of customers\">\r\n    <mat-expansion-panel-header>\r\n      <mat-panel-title>\r\n        <b>{{customer.user_id}}</b>\r\n      </mat-panel-title>\r\n      <mat-panel-description>\r\n        <!-- {{panelOpenState ? '' : customer.firstname + ' ' + customer.lastname }} -->\r\n        <div class=\"customer-name\">{{customer.firstname}} {{customer.lastname}}</div>\r\n        <div class=\"customer-phone\">{{customer.phone}}</div>\r\n        <div class=\"customer-email\">{{customer.email}}</div>\r\n        <div class=\"customer-wechat\">{{customer.wechat}}</div>\r\n        <div class=\"customer-region\">{{customer.region}}</div>\r\n      </mat-panel-description>\r\n    </mat-expansion-panel-header>\r\n    <p>{{customer.firstname}} {{customer.lastname}}, {{customer.phone}}, {{customer.email}}, {{customer.wechat}}, {{customer.region}}</p>\r\n    <div class=\"customer-shipments\" *ngIf=\"(customer.shipments | json) != '[]'\">\r\n      <p><b>Shipments:</b></p>\r\n      <div *ngFor=\"let shipment of customer.shipments\">\r\n        <!-- <a (click)=\"navigate(shipment.shipment_id)\">Shipment - ID {{shipment.shipment_id}}</a><br> -->\r\n        <button mat-button (click)=\"navigate(shipment.shipment_id)\">Shipment - ID {{shipment.shipment_id}}</button><br>\r\n        <!-- href=\"/shipments/{{shipment.shipment_id}} -->\r\n      </div>\r\n    </div>\r\n  </mat-expansion-panel>\r\n</mat-accordion>\r\n"

/***/ }),

/***/ "./src/app/views/customers/customers.component.scss":
/***/ (function(module, exports) {

module.exports = ".mat-expansion-panel-header-title {\n  -webkit-box-flex: 0 !important;\n      -ms-flex-positive: 0 !important;\n          flex-grow: 0 !important;\n  width: 16%; }\n\n.mat-row {\n  display: none !important; }\n\n.mat-expansion-indicator::after, .mat-expansion-panel-header-description {\n  color: #363636; }\n\n.customer-name, .customer-phone,\n.customer-email, .customer-wechat, .customer-region {\n  width: 22%; }\n"

/***/ }),

/***/ "./src/app/views/customers/customers.component.ts":
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, "a", function() { return CustomersComponent; });
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_0__angular_core__ = __webpack_require__("./node_modules/@angular/core/esm5/core.js");
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_1__services_connection_service__ = __webpack_require__("./src/app/services/connection.service.ts");
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_2__angular_router__ = __webpack_require__("./node_modules/@angular/router/esm5/router.js");
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_3__angular_material__ = __webpack_require__("./node_modules/@angular/material/esm5/material.es5.js");
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_4__app_component__ = __webpack_require__("./src/app/app.component.ts");
var __decorate = (this && this.__decorate) || function (decorators, target, key, desc) {
    var c = arguments.length, r = c < 3 ? target : desc === null ? desc = Object.getOwnPropertyDescriptor(target, key) : desc, d;
    if (typeof Reflect === "object" && typeof Reflect.decorate === "function") r = Reflect.decorate(decorators, target, key, desc);
    else for (var i = decorators.length - 1; i >= 0; i--) if (d = decorators[i]) r = (c < 3 ? d(r) : c > 3 ? d(target, key, r) : d(target, key)) || r;
    return c > 3 && r && Object.defineProperty(target, key, r), r;
};
var __metadata = (this && this.__metadata) || function (k, v) {
    if (typeof Reflect === "object" && typeof Reflect.metadata === "function") return Reflect.metadata(k, v);
};





var CustomersComponent = (function () {
    function CustomersComponent(connection, ac, router) {
        this.connection = connection;
        this.ac = ac;
        this.router = router;
        this.customers = [];
        this.customer_shipments = [];
        this.displayedColumns = ['id', , 'name', 'phone', 'email', 'wechat', 'region'];
        this.dataSource = new __WEBPACK_IMPORTED_MODULE_3__angular_material__["v" /* MatTableDataSource */]();
    }
    CustomersComponent.prototype.ngOnInit = function () {
        this.getCustomers();
    };
    CustomersComponent.prototype.getCustomers = function () {
        var _this = this;
        var url = window.otto_data + '/dev.php/api/beta/customers';
        this.connection.get(url).subscribe(function (res) {
            var data = [];
            _this.customers = res.data;
            for (var i = 0; i < res.data.length; i++) {
                var customer = res.data[i];
                data.push(customer);
            }
            // console.log(this.datasource);
            console.log(data);
            _this.dataSource.data = data;
        });
    };
    CustomersComponent.prototype.navigate = function (id) {
        // let hash = this.router.url.replace(/^\/admin\/([a-z0-9]*)\/(.*)/g, '$1');
        // console.log(id);
        this.router.navigateByUrl('/shipments/' + id);
    };
    CustomersComponent = __decorate([
        Object(__WEBPACK_IMPORTED_MODULE_0__angular_core__["n" /* Component */])({
            selector: 'app-customers',
            template: __webpack_require__("./src/app/views/customers/customers.component.html"),
            styles: [__webpack_require__("./src/app/views/customers/customers.component.scss")]
        }),
        __metadata("design:paramtypes", [__WEBPACK_IMPORTED_MODULE_1__services_connection_service__["a" /* ConnectionService */],
            __WEBPACK_IMPORTED_MODULE_4__app_component__["a" /* AppComponent */],
            __WEBPACK_IMPORTED_MODULE_2__angular_router__["b" /* Router */]])
    ], CustomersComponent);
    return CustomersComponent;
}());



/***/ }),

/***/ "./src/app/views/flights/flight-detail/flight-detail.component.html":
/***/ (function(module, exports) {

module.exports = "<div class=\"content-container\">\n  <mat-toolbar class=\"admin-toolbar\">\n    <a href=\"../flights\"><i class=\"material-icons\">chevron_left</i></a>\n    <span>Flight Detail</span>\n  </mat-toolbar>\n  <div class=\"centered\" *ngIf=\"!flight\">\n    <mat-spinner></mat-spinner>\n    <p> Loading<p>\n  </div>\n  <div class=\"flight-detail\" *ngIf=\"flight\">\n    <div class=\"flight-header\">\n      <p>\n        Flight - ID {{id}}\n        <span style=\"float: right; padding-right: 5rem; text-align:right; line-height: 1.4; font-size: 22px\">\n          <b>${{total_price}}</b><br>{{flight.date_added}}\n        </span>\n      </p>\n    </div>\n\n    <div class=\"flight-center\">\n      <mat-card class=\"flight-card\">\n        <mat-tab-group>\n          <mat-tab label=\"Info\">\n            <div class=\"flight-info\">\n              <div class=\"info-customer\" *ngIf=\"customer\">\n                <p class=\"info-header\"><i class=\"material-icons\">person</i> <span>Customer</span></p>\n\n                <table class=\"simple\">\n                  <thead>\n                    <tr>\n                      <th class=\"info-table-row\"><b>ID</b></th>\n                      <th class=\"info-table-row\"><b>Name</b></th>\n                      <th class=\"info-table-row\"><b>Phone</b></th>\n                      <th class=\"info-table-row\"><b>Email</b></th>\n                      <th class=\"info-table-row\"><b>WeChat</b></th>\n                    </tr>\n                    <mat-divider></mat-divider>\n                    <tr>\n                      <th class=\"info-table-row\">{{customer.user_id}}</th>\n                      <th class=\"info-table-row\">{{customer.firstname}} {{customer.lastname}}</th>\n                      <th class=\"info-table-row\">{{customer.phone}}</th>\n                      <th class=\"info-table-row\">{{customer.email}}</th>\n                      <th class=\"info-table-row\">{{customer.wechat}}</th>\n                    </tr>\n                  </thead>\n                </table>\n\n              </div>\n              <div class=\"info-address\">\n                <p class=\"info-header\"><i class=\"material-icons\">local_airport</i> <span>Flight</span></p>\n\n                <div class=\"flight-map\">\n                  <agm-map [latitude]=\"(d_lat + a_lat)/2\" [longitude]=\"(d_lng + a_lng)/2\" [zoom]=\"3\" [gestureHandling]=\"'coopeative'\">\n                      <agm-marker [latitude]=\"d_lat\" [longitude]=\"d_lng\"></agm-marker>\n                      <agm-marker [latitude]=\"a_lat\" [longitude]=\"a_lng\"></agm-marker>\n                  </agm-map>\n                </div>\n                <div class=\"flight-airport\">\n                  <div class=\"flight-departure\">\n                    <p>June 24th, 2018</p>\n                    <p>Toronto Pearson Airport - Shanghai Pudong Airport</p>\n                  </div>\n                  <div class=\"flight-return\">\n                    <p>June 28th, 2018</p>\n                    <p>Shanghai Pudong Airport - Toronto Pearson Airport</p>\n                  </div>\n                </div>\n              </div>\n              <div class=\"info-status\">\n                <p class=\"info-header\"><i class=\"material-icons\">access_time</i> <span>Status</span></p>\n                <table class=\"simple\">\n                  <thead>\n                    <tr>\n                      <th class=\"info-table-row\"><b>Status</b></th>\n                      <th class=\"info-table-row\"><b>Date</b></th>\n                    </tr>\n                    <mat-divider></mat-divider>\n                    <tr>\n                      <th class=\"info-table-row\">Created</th>\n                      <th class=\"info-table-row\">{{flight.date_added}}</th>\n                    </tr>\n                  </thead>\n                </table>\n              </div>\n              <!-- <div class=\"info-shipping\">\n                <p class=\"info-header\"><i class=\"material-icons\">airplanemode_active</i> <span>Shipping</span></p>\n              </div> -->\n            </div>\n          </mat-tab>\n\n          <mat-tab label=\"Items\">\n            <div class=\"flight-item\">\n              <table class=\"simple\">\n                <thead>\n                  <tr>\n                    <th class=\"info-table-row\"><b>Name</b></th>\n                    <th class=\"info-table-row\"><b>Quantity</b></th>\n                    <th class=\"info-table-row\"><b>Item Price (Est.)</b></th>\n                    <th class=\"info-table-row\"><b>Weight (Total)</b></th>\n                  </tr>\n                  <mat-divider></mat-divider>\n                  <tr *ngFor=\"let item of items\">\n                    <th class=\"info-table-row\">{{item.item_name}}</th>\n                    <th class=\"info-table-row\">{{item.item_count}}</th>\n                    <th class=\"info-table-row\">{{item.item_price}}</th>\n                    <th class=\"info-table-row\">{{item.item_weight}}</th>\n                  </tr>\n                </thead>\n              </table>\n              <div class=\"item-total\">\n                <p>Total Price: ${{total_price}}</p>\n              </div>\n            </div>\n          </mat-tab>\n\n        </mat-tab-group>\n      </mat-card>\n    </div>\n  </div>\n</div>\n"

/***/ }),

/***/ "./src/app/views/flights/flight-detail/flight-detail.component.scss":
/***/ (function(module, exports) {

module.exports = ".admin-toolbar {\n  font-family: 'Montserrat', sans-serif; }\n  .admin-toolbar a {\n    float: left;\n    padding-top: 8px;\n    padding-right: 1rem; }\n  .admin-toolbar .material-icons {\n    font-size: 32px; }\n  .flight-detail {\n  font-family: 'Montserrat', sans-serif; }\n  .flight-detail table {\n    width: 100%; }\n  .flight-detail .flight-header {\n    font-size: 20px;\n    color: white;\n    position: absolute;\n    z-index: 1;\n    height: 168px;\n    width: 100%;\n    background-color: #6e2da8;\n    background-size: cover; }\n  .flight-detail .flight-header p {\n      padding-top: 2rem;\n      padding-left: 4.5rem; }\n  .flight-detail .flight-header a {\n      position: absolute;\n      z-index: 3; }\n  .flight-detail .flight-header .material-icons {\n      font-size: 30px;\n      float: left;\n      padding-right: 1rem; }\n  .flight-detail .flight-center {\n    z-index: 2;\n    position: relative;\n    width: 94%;\n    padding-top: 120px;\n    padding-left: 3%; }\n  .flight-detail .flight-center .flight-card {\n      height: 1100px;\n      padding: 0 !important;\n      -webkit-box-shadow: 0 8px 10px 1px rgba(0, 0, 0, 0.14), 0 3px 14px 2px rgba(0, 0, 0, 0.12), 0 5px 5px -3px rgba(0, 0, 0, 0.3);\n              box-shadow: 0 8px 10px 1px rgba(0, 0, 0, 0.14), 0 3px 14px 2px rgba(0, 0, 0, 0.12), 0 5px 5px -3px rgba(0, 0, 0, 0.3); }\n  .flight-detail .flight-center .flight-card .flight-info {\n        padding: 1rem 2rem 1rem 2rem; }\n  .flight-detail .flight-center .flight-card .flight-info .info-header {\n          font-size: 18px; }\n  .flight-detail .flight-center .flight-card .flight-info .info-header .material-icons {\n            padding-right: 10px !important; }\n  .flight-detail .flight-center .flight-card .flight-info .info-address {\n          padding-top: 1rem;\n          height: 550px; }\n  .flight-detail .flight-center .flight-card .flight-info .info-address agm-map {\n            width: 100%;\n            height: 350px;\n            padding-right: 1.5rem; }\n  .flight-detail .flight-center .flight-card .flight-info .info-address .flight-map {\n            float: left;\n            width: 100%;\n            padding-right: 1.5rem; }\n  .flight-detail .flight-center .flight-card .flight-info .info-address .flight-airport {\n            font-family: 'Montserrat', sans-serif; }\n  .flight-detail .flight-center .flight-card .flight-info .info-address .flight-airport .flight-departure {\n              width: 50%;\n              float: left; }\n  .flight-detail .flight-center .flight-card .flight-info .info-address .flight-airport .flight-return {\n              width: 50%;\n              float: right; }\n  .flight-detail .flight-center .flight-card .flight-info .info-status {\n          padding-top: 1rem; }\n  .flight-detail .flight-center .flight-card .flight-info .info-shipping {\n          padding-top: 1rem; }\n  .flight-detail .flight-center .flight-card .flight-item {\n        padding: 1rem; }\n  .flight-detail .flight-center .flight-card .flight-item .simple {\n          width: 100%; }\n  .flight-detail .flight-center .flight-card .flight-item .item-total {\n          padding-top: 1rem;\n          width: 24%;\n          float: right; }\n  .flight-detail .flight-center .flight-card .flight-item .info-table-row {\n          padding-bottom: 1.5rem !important; }\n  .flight-detail .flight-center .flight-card mat-tab {\n        height: 100px !important; }\n  .flight-detail .flight-center .flight-card .info-table-row {\n        padding: 10px;\n        text-align: left;\n        width: 19% !important;\n        font-weight: normal !important;\n        font-family: 'Montserrat', sans-serif; }\n  .centered {\n  position: fixed;\n  top: 50%;\n  left: 50%;\n  /* bring your own prefixes */\n  -webkit-transform: translate(-50%, -50%);\n          transform: translate(-50%, -50%);\n  padding-left: 15rem; }\n  .centered p {\n    font-size: 22px;\n    font-family: 'Montserrat', sans-serif;\n    padding-top: 1rem;\n    padding-left: 0rem; }\n"

/***/ }),

/***/ "./src/app/views/flights/flight-detail/flight-detail.component.ts":
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, "a", function() { return FlightDetailComponent; });
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_0__angular_core__ = __webpack_require__("./node_modules/@angular/core/esm5/core.js");
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_1__services_connection_service__ = __webpack_require__("./src/app/services/connection.service.ts");
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_2__angular_router__ = __webpack_require__("./node_modules/@angular/router/esm5/router.js");
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_3__app_component__ = __webpack_require__("./src/app/app.component.ts");
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_4__angular_common_http__ = __webpack_require__("./node_modules/@angular/common/esm5/http.js");
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_5__angular_http__ = __webpack_require__("./node_modules/@angular/http/esm5/http.js");
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_6_rxjs_add_operator_map__ = __webpack_require__("./node_modules/rxjs/_esm5/add/operator/map.js");
var __decorate = (this && this.__decorate) || function (decorators, target, key, desc) {
    var c = arguments.length, r = c < 3 ? target : desc === null ? desc = Object.getOwnPropertyDescriptor(target, key) : desc, d;
    if (typeof Reflect === "object" && typeof Reflect.decorate === "function") r = Reflect.decorate(decorators, target, key, desc);
    else for (var i = decorators.length - 1; i >= 0; i--) if (d = decorators[i]) r = (c < 3 ? d(r) : c > 3 ? d(target, key, r) : d(target, key)) || r;
    return c > 3 && r && Object.defineProperty(target, key, r), r;
};
var __metadata = (this && this.__metadata) || function (k, v) {
    if (typeof Reflect === "object" && typeof Reflect.metadata === "function") return Reflect.metadata(k, v);
};







var FlightDetailComponent = (function () {
    function FlightDetailComponent(connection, ac, router, ar, client, http) {
        this.connection = connection;
        this.ac = ac;
        this.router = router;
        this.ar = ar;
        this.client = client;
        this.http = http;
    }
    FlightDetailComponent.prototype.ngOnInit = function () {
        var _this = this;
        this.ar.params.subscribe(function (params) {
            _this.id = params.id;
        });
        console.log(this.id);
        this.getFlight(this.id);
        this.d_lat = 56.1304;
        this.d_lng = -106.3468;
        this.a_lat = 39.913818;
        this.a_lng = 116.363625;
    };
    FlightDetailComponent.prototype.getFlight = function (id) {
        var _this = this;
        this.connection.get(window.otto_data + '/dev.php/api/beta/flights/' + id).subscribe(function (res) {
            console.log(res);
            _this.flight = res.data;
            // this.s_lat = this.shipment.s_latitude;
            // this.s_lng = this.shipment.s_longitude;
            // this.r_lat = this.shipment.r_latitude;
            // this.r_lng = this.shipment.r_longitude;
            _this.connection.get(window.otto_data + '/dev.php/api/beta/customers/' + _this.flight.user_id).subscribe(function (res) {
                _this.customer = res.data;
                console.log(_this.customer);
            });
        });
    };
    FlightDetailComponent = __decorate([
        Object(__WEBPACK_IMPORTED_MODULE_0__angular_core__["n" /* Component */])({
            selector: 'app-flight-detail',
            template: __webpack_require__("./src/app/views/flights/flight-detail/flight-detail.component.html"),
            styles: [__webpack_require__("./src/app/views/flights/flight-detail/flight-detail.component.scss")]
        }),
        __metadata("design:paramtypes", [__WEBPACK_IMPORTED_MODULE_1__services_connection_service__["a" /* ConnectionService */],
            __WEBPACK_IMPORTED_MODULE_3__app_component__["a" /* AppComponent */],
            __WEBPACK_IMPORTED_MODULE_2__angular_router__["b" /* Router */],
            __WEBPACK_IMPORTED_MODULE_2__angular_router__["a" /* ActivatedRoute */],
            __WEBPACK_IMPORTED_MODULE_4__angular_common_http__["b" /* HttpClient */],
            __WEBPACK_IMPORTED_MODULE_5__angular_http__["a" /* Http */]])
    ], FlightDetailComponent);
    return FlightDetailComponent;
}());



/***/ }),

/***/ "./src/app/views/flights/flights.component.css":
/***/ (function(module, exports) {

module.exports = "mat-row {\r\n    cursor: pointer;\r\n}\r\n"

/***/ }),

/***/ "./src/app/views/flights/flights.component.html":
/***/ (function(module, exports) {

module.exports = "<div class=\"content-container\">\r\n  <mat-toolbar class=\"admin-toolbar\">\r\n    <span>Flights</span>\r\n  </mat-toolbar>\r\n  <div class=\"flight-list\">\r\n    <mat-table #table [dataSource]=\"dataSource\">\r\n\r\n      <!--- Note that these columns can be defined in any order.\r\n        The actual rendered columns are set as a property on the row definition\" -->\r\n\r\n      <ng-container matColumnDef=\"id\">\r\n        <mat-header-cell *matHeaderCellDef> ID </mat-header-cell>\r\n        <mat-cell *matCellDef=\"let flight\"> {{flight.flight_id}} </mat-cell>\r\n      </ng-container>\r\n\r\n      <ng-container matColumnDef=\"name\">\r\n        <mat-header-cell *matHeaderCellDef> Name </mat-header-cell>\r\n        <mat-cell *matCellDef=\"let flight\"> {{flight.name}} </mat-cell>\r\n      </ng-container>\r\n\r\n      <ng-container matColumnDef=\"date_departure\">\r\n        <mat-header-cell *matHeaderCellDef> Departure Date </mat-header-cell>\r\n        <mat-cell *matCellDef=\"let flight\"> {{flight.date_departure}} </mat-cell>\r\n      </ng-container>\r\n\r\n      <ng-container matColumnDef=\"date_arrival\">\r\n        <mat-header-cell *matHeaderCellDef> Arrival Date </mat-header-cell>\r\n        <mat-cell *matCellDef=\"let flight\"> {{flight.date_arrival}} </mat-cell>\r\n      </ng-container>\r\n\r\n      <ng-container matColumnDef=\"price\">\r\n        <mat-header-cell *matHeaderCellDef> Price </mat-header-cell>\r\n        <mat-cell *matCellDef=\"let flight\"> {{flight.price}} </mat-cell>\r\n      </ng-container>\r\n\r\n      <ng-container matColumnDef=\"reference\">\r\n        <mat-header-cell *matHeaderCellDef> Reference </mat-header-cell>\r\n        <mat-cell *matCellDef=\"let flight\"> {{flight.reference}} </mat-cell>\r\n      </ng-container>\r\n\r\n      <mat-header-row *matHeaderRowDef=\"displayedColumns\"></mat-header-row>\r\n      <mat-row *matRowDef=\"let row; columns: displayedColumns;\" (click)=\"navigate(row)\"></mat-row>\r\n    </mat-table>\r\n  </div>\r\n</div>\r\n"

/***/ }),

/***/ "./src/app/views/flights/flights.component.ts":
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, "a", function() { return FlightsComponent; });
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_0__angular_core__ = __webpack_require__("./node_modules/@angular/core/esm5/core.js");
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_1__services_connection_service__ = __webpack_require__("./src/app/services/connection.service.ts");
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_2__angular_router__ = __webpack_require__("./node_modules/@angular/router/esm5/router.js");
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_3__angular_material__ = __webpack_require__("./node_modules/@angular/material/esm5/material.es5.js");
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_4__app_component__ = __webpack_require__("./src/app/app.component.ts");
var __decorate = (this && this.__decorate) || function (decorators, target, key, desc) {
    var c = arguments.length, r = c < 3 ? target : desc === null ? desc = Object.getOwnPropertyDescriptor(target, key) : desc, d;
    if (typeof Reflect === "object" && typeof Reflect.decorate === "function") r = Reflect.decorate(decorators, target, key, desc);
    else for (var i = decorators.length - 1; i >= 0; i--) if (d = decorators[i]) r = (c < 3 ? d(r) : c > 3 ? d(target, key, r) : d(target, key)) || r;
    return c > 3 && r && Object.defineProperty(target, key, r), r;
};
var __metadata = (this && this.__metadata) || function (k, v) {
    if (typeof Reflect === "object" && typeof Reflect.metadata === "function") return Reflect.metadata(k, v);
};





var FlightsComponent = (function () {
    function FlightsComponent(connection, ac, router) {
        this.connection = connection;
        this.ac = ac;
        this.router = router;
        this.flights = [];
        this.displayedColumns = ['id', 'name', 'date_departure', 'date_arrival', 'price', 'reference'];
        this.dataSource = new __WEBPACK_IMPORTED_MODULE_3__angular_material__["v" /* MatTableDataSource */]();
    }
    FlightsComponent.prototype.ngOnInit = function () {
        this.getFlights();
    };
    FlightsComponent.prototype.getFlights = function () {
        var _this = this;
        var url = window.otto_data + '/dev.php/api/beta/flights';
        this.connection.get(url).subscribe(function (res) {
            var data = [];
            for (var i = 0; i < res.data.length; i++) {
                var flight = res.data[i];
                data.push(flight);
            }
            // console.log(this.datasource);
            console.log(data);
            _this.dataSource.data = data;
        });
    };
    FlightsComponent.prototype.navigate = function (row) {
        this.id = row.flight_id;
        this.router.navigateByUrl('/flights/' + this.id);
    };
    FlightsComponent = __decorate([
        Object(__WEBPACK_IMPORTED_MODULE_0__angular_core__["n" /* Component */])({
            selector: 'app-flights',
            template: __webpack_require__("./src/app/views/flights/flights.component.html"),
            styles: [__webpack_require__("./src/app/views/flights/flights.component.css")]
        }),
        __metadata("design:paramtypes", [__WEBPACK_IMPORTED_MODULE_1__services_connection_service__["a" /* ConnectionService */],
            __WEBPACK_IMPORTED_MODULE_4__app_component__["a" /* AppComponent */],
            __WEBPACK_IMPORTED_MODULE_2__angular_router__["b" /* Router */]])
    ], FlightsComponent);
    return FlightsComponent;
}());



/***/ }),

/***/ "./src/app/views/home/home.component.html":
/***/ (function(module, exports) {

module.exports = "<div>\r\n  <mat-grid-list cols=\"4\" rowHeight=\"2:1\">\r\n    <mat-grid-tile>\r\n      <mat-card>Customers</mat-card>\r\n    </mat-grid-tile>\r\n    <mat-grid-tile>\r\n      <mat-card>Flights</mat-card>\r\n    </mat-grid-tile>\r\n    <mat-grid-tile>\r\n      <mat-card>Shipments</mat-card>\r\n    </mat-grid-tile>\r\n    <mat-grid-tile>\r\n      <mat-card>Orders</mat-card>\r\n    </mat-grid-tile>\r\n  </mat-grid-list>\r\n</div>\r\n"

/***/ }),

/***/ "./src/app/views/home/home.component.scss":
/***/ (function(module, exports) {

module.exports = ""

/***/ }),

/***/ "./src/app/views/home/home.component.ts":
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, "a", function() { return HomeComponent; });
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_0__angular_core__ = __webpack_require__("./node_modules/@angular/core/esm5/core.js");
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_1__services_connection_service__ = __webpack_require__("./src/app/services/connection.service.ts");
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_2__angular_router__ = __webpack_require__("./node_modules/@angular/router/esm5/router.js");
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_3__app_component__ = __webpack_require__("./src/app/app.component.ts");
var __decorate = (this && this.__decorate) || function (decorators, target, key, desc) {
    var c = arguments.length, r = c < 3 ? target : desc === null ? desc = Object.getOwnPropertyDescriptor(target, key) : desc, d;
    if (typeof Reflect === "object" && typeof Reflect.decorate === "function") r = Reflect.decorate(decorators, target, key, desc);
    else for (var i = decorators.length - 1; i >= 0; i--) if (d = decorators[i]) r = (c < 3 ? d(r) : c > 3 ? d(target, key, r) : d(target, key)) || r;
    return c > 3 && r && Object.defineProperty(target, key, r), r;
};
var __metadata = (this && this.__metadata) || function (k, v) {
    if (typeof Reflect === "object" && typeof Reflect.metadata === "function") return Reflect.metadata(k, v);
};




var HomeComponent = (function () {
    function HomeComponent(connection, ac, router, ar) {
        this.connection = connection;
        this.ac = ac;
        this.router = router;
        this.ar = ar;
        this.cookieValue = 'UNKNOWN';
    }
    HomeComponent.prototype.ngOnInit = function () {
        this.ar.url.subscribe(function (url) {
            // location.reload();
        });
    };
    HomeComponent = __decorate([
        Object(__WEBPACK_IMPORTED_MODULE_0__angular_core__["n" /* Component */])({
            selector: 'app-home',
            template: __webpack_require__("./src/app/views/home/home.component.html"),
            styles: [__webpack_require__("./src/app/views/home/home.component.scss")]
        }),
        __metadata("design:paramtypes", [__WEBPACK_IMPORTED_MODULE_1__services_connection_service__["a" /* ConnectionService */],
            __WEBPACK_IMPORTED_MODULE_3__app_component__["a" /* AppComponent */],
            __WEBPACK_IMPORTED_MODULE_2__angular_router__["b" /* Router */],
            __WEBPACK_IMPORTED_MODULE_2__angular_router__["a" /* ActivatedRoute */]])
    ], HomeComponent);
    return HomeComponent;
}());



/***/ }),

/***/ "./src/app/views/login/login.component.html":
/***/ (function(module, exports) {

module.exports = "<div class=\"login-body\">\n  <div class=\"logo noselect\">\n    OttoAir\n  </div>\n  <mat-card>\n    <form class=\"example-form\" (ngSubmit)=\"onSubmit()\">\n      <div class=\"input-header\">\n        <h3 class=\"noselect\">Admin Login</h3>\n      </div>\n      <div class=\"input-field\">\n        <mat-form-field class=\"example-full-width\">\n          <input matInput placeholder=\"Phone\" [(ngModel)]=\"phone\" name=\"phone\">\n        </mat-form-field>\n        <mat-form-field class=\"example-full-width\">\n          <input matInput type=\"password\" placeholder=\"Password\" [(ngModel)]=\"password\" name=\"password\">\n        </mat-form-field>\n      </div>\n\n      <div class=\"login-button\">\n        <button type=\"submit\" class=\"btn\" mat-button>Log In</button>\n      </div>\n\n      <mat-spinner *ngIf=\"loading\"></mat-spinner>\n\n      <div class=\"login-footer\">\n        <p class=\"noselect\">*You should not be there if you're not an OttoAir admin.</p>\n      </div>\n    </form>\n  </mat-card>\n</div>\n"

/***/ }),

/***/ "./src/app/views/login/login.component.scss":
/***/ (function(module, exports) {

module.exports = ".login-body {\n  width: 100%;\n  height: 100%;\n  background-image: url(\"/admin/assets/images/b2.jpg\");\n  background-position: center;\n  background-repeat: no-repeat;\n  background-size: cover;\n  /* portrait tablets, portrait iPad, landscape e-readers, landscape 800x480 or 854x480 phones */\n  /* tablet, landscape iPad, lo-res laptops ands desktops */\n  /* big landscape tablets, laptops, and desktops */\n  /* hi-res laptops and desktops */ }\n  .login-body .logo {\n    font-family: 'Montserrat', sans-serif;\n    font-weight: bolder;\n    color: white;\n    font-size: 2.3rem;\n    padding: 1.5rem 0 0 2rem; }\n  .login-body .noselect {\n    -webkit-touch-callout: none;\n    /* iOS Safari */\n    -webkit-user-select: none;\n    /* Safari */\n    /* Konqueror HTML */\n    -moz-user-select: none;\n    /* Firefox */\n    -ms-user-select: none;\n    /* Internet Explorer/Edge */\n    user-select: none;\n    /* Non-prefixed version, currently\r\n\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\tsupported by Chrome and Opera */ }\n  .login-body .example-form {\n    min-width: 150px;\n    max-width: 500px; }\n  .login-body .example-full-width {\n    width: 100%; }\n  .login-body .mat-card {\n    height: 40%;\n    top: 50%;\n    margin: auto;\n    padding: 50px;\n    border-radius: 15px;\n    position: relative;\n    -webkit-transform: translateY(-50%);\n            transform: translateY(-50%);\n    -webkit-box-shadow: 0 15px 15px 1px rgba(0, 0, 0, 0.14), 0 3px 14px 2px rgba(0, 0, 0, 0.12), 0 5px 5px -3px rgba(0, 0, 0, 0.3);\n            box-shadow: 0 15px 15px 1px rgba(0, 0, 0, 0.14), 0 3px 14px 2px rgba(0, 0, 0, 0.12), 0 5px 5px -3px rgba(0, 0, 0, 0.3);\n    border: 3px solid #6e2da8; }\n  .login-body .mat-card .input-header {\n      font-family: 'Montserrat', sans-serif;\n      font-weight: bolder;\n      color: #6e2da8;\n      font-size: 2rem;\n      text-align: center; }\n  .login-body .mat-card .input-field {\n      padding-top: 10%;\n      padding-bottom: 5%; }\n  .login-body .mat-card .login-button {\n      margin: auto;\n      width: 50%;\n      padding: 20px; }\n  .login-body .mat-card .login-button .btn {\n        width: 100%; }\n  .login-body .mat-card .login-footer {\n      font-family: 'Montserrat', sans-serif;\n      font-weight: bolder;\n      color: #6e2da8;\n      font-size: 0.85rem;\n      padding-top: 20%; }\n  @media (max-width: 641px) {\n    .login-body .mat-card {\n      width: 55%; }\n      .login-body .mat-card .login-footer {\n        display: none; } }\n  @media (min-width: 641px) {\n    .login-body .mat-card {\n      width: 50%; }\n      .login-body .mat-card .input-header {\n        font-size: 1rem; } }\n  @media (max-width: 961px) {\n    .login-body .mat-card .login-footer {\n      display: none; } }\n  @media (min-width: 961px) {\n    .login-body .mat-card {\n      width: 35%; }\n      .login-body .mat-card .input-header {\n        font-size: 1.1rem; } }\n  @media (min-width: 1025px) {\n    .login-body .mat-card {\n      width: 25%; }\n      .login-body .mat-card .input-header {\n        font-size: 1.3rem; } }\n  @media (min-width: 1281px) {\n    .login-body .mat-card {\n      width: 20%; }\n      .login-body .mat-card .input-header {\n        font-size: 1.5rem; } }\n  @media (min-width: 1581px) {\n    .login-body .mat-card {\n      width: 15%; } }\n  .login-body .mat-button {\n    color: white;\n    background-color: #6e2da8; }\n"

/***/ }),

/***/ "./src/app/views/login/login.component.ts":
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, "a", function() { return LoginComponent; });
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_0__angular_core__ = __webpack_require__("./node_modules/@angular/core/esm5/core.js");
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_1__services_connection_service__ = __webpack_require__("./src/app/services/connection.service.ts");
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_2__angular_router__ = __webpack_require__("./node_modules/@angular/router/esm5/router.js");
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_3__app_component__ = __webpack_require__("./src/app/app.component.ts");
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_4_ngx_cookie_service__ = __webpack_require__("./node_modules/ngx-cookie-service/index.js");
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_5__angular_material__ = __webpack_require__("./node_modules/@angular/material/esm5/material.es5.js");
var __decorate = (this && this.__decorate) || function (decorators, target, key, desc) {
    var c = arguments.length, r = c < 3 ? target : desc === null ? desc = Object.getOwnPropertyDescriptor(target, key) : desc, d;
    if (typeof Reflect === "object" && typeof Reflect.decorate === "function") r = Reflect.decorate(decorators, target, key, desc);
    else for (var i = decorators.length - 1; i >= 0; i--) if (d = decorators[i]) r = (c < 3 ? d(r) : c > 3 ? d(target, key, r) : d(target, key)) || r;
    return c > 3 && r && Object.defineProperty(target, key, r), r;
};
var __metadata = (this && this.__metadata) || function (k, v) {
    if (typeof Reflect === "object" && typeof Reflect.metadata === "function") return Reflect.metadata(k, v);
};






var LoginComponent = (function () {
    function LoginComponent(connection, ac, router, cookie, snackBar) {
        this.connection = connection;
        this.ac = ac;
        this.router = router;
        this.cookie = cookie;
        this.snackBar = snackBar;
        this.loading = false;
    }
    LoginComponent.prototype.ngOnInit = function () {
    };
    LoginComponent.prototype.onSubmit = function () {
        var _this = this;
        this.loading = true;
        var url = window.otto_data + '/dev.php/api/beta/admin';
        var query = {
            "username": this.phone,
            "password": this.password
        };
        this.connection.post(url, query).subscribe(function (res) {
            if (res.data.login == true) {
                _this.cookie.set('OTTO_ADMIN', res.data.token, 0.1);
                // this.router.navigateByUrl('/admin/');
                location.replace("/admin/");
            }
            else {
                _this.loading = false;
                _this.failedNoti();
            }
        });
    };
    LoginComponent.prototype.failedNoti = function () {
        this.snackBar.open('LOGIN FAILED', 'Retry', {
            duration: 5000,
        });
    };
    LoginComponent = __decorate([
        Object(__WEBPACK_IMPORTED_MODULE_0__angular_core__["n" /* Component */])({
            selector: 'app-login',
            template: __webpack_require__("./src/app/views/login/login.component.html"),
            styles: [__webpack_require__("./src/app/views/login/login.component.scss")]
        }),
        __metadata("design:paramtypes", [__WEBPACK_IMPORTED_MODULE_1__services_connection_service__["a" /* ConnectionService */],
            __WEBPACK_IMPORTED_MODULE_3__app_component__["a" /* AppComponent */],
            __WEBPACK_IMPORTED_MODULE_2__angular_router__["b" /* Router */],
            __WEBPACK_IMPORTED_MODULE_4_ngx_cookie_service__["a" /* CookieService */],
            __WEBPACK_IMPORTED_MODULE_5__angular_material__["u" /* MatSnackBar */]])
    ], LoginComponent);
    return LoginComponent;
}());



/***/ }),

/***/ "./src/app/views/orders/orders.component.css":
/***/ (function(module, exports) {

module.exports = ""

/***/ }),

/***/ "./src/app/views/orders/orders.component.html":
/***/ (function(module, exports) {

module.exports = "<div class=\"content-container\">\r\n  <mat-toolbar class=\"admin-toolbar\">\r\n    <span>Orders</span>\r\n  </mat-toolbar>\r\n  <div class=\"order-list\">\r\n    <mat-table #table [dataSource]=\"dataSource\">\r\n\r\n      <!--- Note that these columns can be defined in any order.\r\n        The actual rendered columns are set as a property on the row definition\" -->\r\n\r\n      <ng-container matColumnDef=\"id\">\r\n        <mat-header-cell *matHeaderCellDef> ID </mat-header-cell>\r\n        <mat-cell *matCellDef=\"let order\"> {{order.order_id}} </mat-cell>\r\n      </ng-container>\r\n\r\n      <ng-container matColumnDef=\"receiver_name\">\r\n        <mat-header-cell *matHeaderCellDef> Receiver Name </mat-header-cell>\r\n        <mat-cell *matCellDef=\"let order\"> {{order.receiver_name}} </mat-cell>\r\n      </ng-container>\r\n\r\n      <ng-container matColumnDef=\"receiver_address\">\r\n        <mat-header-cell *matHeaderCellDef> Address </mat-header-cell>\r\n        <mat-cell *matCellDef=\"let order\"> {{order.receiver_address}} - {{order.receiver_province}}, {{order.receiver_city}}</mat-cell>\r\n      </ng-container>\r\n\r\n      <ng-container matColumnDef=\"price\">\r\n        <mat-header-cell *matHeaderCellDef> Price </mat-header-cell>\r\n        <mat-cell *matCellDef=\"let order\"> {{order.total_with_tax}} </mat-cell>\r\n      </ng-container>\r\n\r\n      <ng-container matColumnDef=\"reference\">\r\n        <mat-header-cell *matHeaderCellDef> Reference </mat-header-cell>\r\n        <mat-cell *matCellDef=\"let order\"> {{order.reference}} </mat-cell>\r\n      </ng-container>\r\n\r\n      <mat-header-row *matHeaderRowDef=\"displayedColumns\"></mat-header-row>\r\n      <mat-row *matRowDef=\"let row; columns: displayedColumns;\"></mat-row>\r\n    </mat-table>\r\n  </div>\r\n</div>\r\n"

/***/ }),

/***/ "./src/app/views/orders/orders.component.ts":
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, "a", function() { return OrdersComponent; });
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_0__angular_core__ = __webpack_require__("./node_modules/@angular/core/esm5/core.js");
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_1__services_connection_service__ = __webpack_require__("./src/app/services/connection.service.ts");
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_2__angular_router__ = __webpack_require__("./node_modules/@angular/router/esm5/router.js");
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_3__angular_material__ = __webpack_require__("./node_modules/@angular/material/esm5/material.es5.js");
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_4__app_component__ = __webpack_require__("./src/app/app.component.ts");
var __decorate = (this && this.__decorate) || function (decorators, target, key, desc) {
    var c = arguments.length, r = c < 3 ? target : desc === null ? desc = Object.getOwnPropertyDescriptor(target, key) : desc, d;
    if (typeof Reflect === "object" && typeof Reflect.decorate === "function") r = Reflect.decorate(decorators, target, key, desc);
    else for (var i = decorators.length - 1; i >= 0; i--) if (d = decorators[i]) r = (c < 3 ? d(r) : c > 3 ? d(target, key, r) : d(target, key)) || r;
    return c > 3 && r && Object.defineProperty(target, key, r), r;
};
var __metadata = (this && this.__metadata) || function (k, v) {
    if (typeof Reflect === "object" && typeof Reflect.metadata === "function") return Reflect.metadata(k, v);
};





var OrdersComponent = (function () {
    function OrdersComponent(connection, ac, router) {
        this.connection = connection;
        this.ac = ac;
        this.router = router;
        this.orders = [];
        this.displayedColumns = ['id', 'receiver_name', 'receiver_address', 'price', 'reference'];
        this.dataSource = new __WEBPACK_IMPORTED_MODULE_3__angular_material__["v" /* MatTableDataSource */]();
    }
    OrdersComponent.prototype.ngOnInit = function () {
        this.getOrders();
    };
    OrdersComponent.prototype.getOrders = function () {
        var _this = this;
        var url = window.otto_data + '/dev.php/api/beta/orders';
        this.connection.get(url).subscribe(function (res) {
            var data = [];
            for (var i = 0; i < res.data.length; i++) {
                var order = res.data[i];
                data.push(order);
            }
            // console.log(this.datasource);
            console.log(data);
            _this.dataSource.data = data;
        });
    };
    OrdersComponent = __decorate([
        Object(__WEBPACK_IMPORTED_MODULE_0__angular_core__["n" /* Component */])({
            selector: 'app-orders',
            template: __webpack_require__("./src/app/views/orders/orders.component.html"),
            styles: [__webpack_require__("./src/app/views/orders/orders.component.css")]
        }),
        __metadata("design:paramtypes", [__WEBPACK_IMPORTED_MODULE_1__services_connection_service__["a" /* ConnectionService */],
            __WEBPACK_IMPORTED_MODULE_4__app_component__["a" /* AppComponent */],
            __WEBPACK_IMPORTED_MODULE_2__angular_router__["b" /* Router */]])
    ], OrdersComponent);
    return OrdersComponent;
}());



/***/ }),

/***/ "./src/app/views/shipments/shipment-detail/shipment-detail.component.html":
/***/ (function(module, exports) {

module.exports = "<div class=\"content-container\">\r\n  <mat-toolbar class=\"admin-toolbar\">\r\n    <a href=\"../shipments\"><i class=\"material-icons\">chevron_left</i></a>\r\n    <span>Shipment Detail</span>\r\n  </mat-toolbar>\r\n  <div class=\"centered\" *ngIf=\"!shipment\">\r\n    <mat-spinner></mat-spinner>\r\n    <p> Loading<p>\r\n  </div>\r\n  <div class=\"shipment-detail\" *ngIf=\"shipment\">\r\n    <div class=\"shipment-header\">\r\n      <p>\r\n        Shipment - ID {{id}}\r\n        <span style=\"float: right; padding-right: 5rem; text-align:right; line-height: 1.4; font-size: 22px\">\r\n          <b>${{total_price}}</b><br>{{shipment.date_added}}\r\n        </span>\r\n      </p>\r\n    </div>\r\n\r\n    <div class=\"shipment-center\">\r\n      <mat-card class=\"shipment-card\">\r\n        <mat-tab-group>\r\n          <mat-tab label=\"Info\">\r\n            <div class=\"shipment-info\">\r\n              <div class=\"info-customer\" *ngIf=\"customer\">\r\n                <p class=\"info-header\"><i class=\"material-icons\">person</i> <span>Customer</span></p>\r\n\r\n                <table class=\"simple\">\r\n                  <thead>\r\n                    <tr>\r\n                      <th class=\"info-table-row\"><b>ID</b></th>\r\n                      <th class=\"info-table-row\"><b>Name</b></th>\r\n                      <th class=\"info-table-row\"><b>Phone</b></th>\r\n                      <th class=\"info-table-row\"><b>Email</b></th>\r\n                      <th class=\"info-table-row\"><b>WeChat</b></th>\r\n                    </tr>\r\n                    <mat-divider></mat-divider>\r\n                    <tr>\r\n                      <th class=\"info-table-row\">{{customer.user_id}}</th>\r\n                      <th class=\"info-table-row\">{{customer.firstname}} {{customer.lastname}}</th>\r\n                      <th class=\"info-table-row\">{{customer.phone}}</th>\r\n                      <th class=\"info-table-row\">{{customer.email}}</th>\r\n                      <th class=\"info-table-row\">{{customer.wechat}}</th>\r\n                    </tr>\r\n                  </thead>\r\n                </table>\r\n\r\n              </div>\r\n              <div class=\"info-address\">\r\n                <p class=\"info-header\"><i class=\"material-icons\">home</i> <span>Address</span></p>\r\n                <mat-tab-group>\r\n                  <mat-tab label=\"Sender Info\">\r\n                    <div class=\"address-detail\">\r\n                      <div class=\"address-map\">\r\n                        <agm-map [latitude]=\"s_lat\" [longitude]=\"s_lng\" [zoom]=\"12\">\r\n                          <agm-marker [latitude]=\"s_lat\" [longitude]=\"s_lng\"></agm-marker>\r\n                        </agm-map>\r\n                      </div>\r\n                      <div class=\"address-text\">\r\n                        <b>Sender</b><br><br>\r\n                        {{shipment.sender_name}} - {{shipment.sender_phone}}, {{shipment.sender_email}}\r\n                        <br><br>\r\n                        <div style=\"padding-bottom: 1rem;\"></div>\r\n                        <b>Address</b><br><br>\r\n                        {{shipment.sender_address}}<br>{{shipment.sender_city}}, {{shipment.sender_province}}, {{shipment.sender_postal}}\r\n                      </div>\r\n                    </div>\r\n                  </mat-tab>\r\n                  <mat-tab label=\"Receiver Info\">\r\n                    <div class=\"address-detail\">\r\n                      <div class=\"address-map\">\r\n                        <agm-map [latitude]=\"r_lat\" [longitude]=\"r_lng\" [zoom]=\"12\">\r\n                          <agm-marker [latitude]=\"r_lat\" [longitude]=\"r_lng\"></agm-marker>\r\n                        </agm-map>\r\n                      </div>\r\n                      <div class=\"address-text\">\r\n                        <b>Receiver</b><br><br>\r\n                        {{shipment.receiver_name}} - {{shipment.receiver_phone}}, {{shipment.receiver_email}}\r\n                        <br><br>\r\n                        <div style=\"padding-bottom: 1rem;\"></div>\r\n                        <b>Address</b><br><br>\r\n                        {{shipment.receiver_address}}<br>{{shipment.receiver_province}}, {{shipment.receiver_city}}, {{shipment.receiver_postal}}\r\n                      </div>\r\n                    </div>\r\n                  </mat-tab>\r\n                </mat-tab-group>\r\n              </div>\r\n              <div class=\"info-status\">\r\n                <p class=\"info-header\"><i class=\"material-icons\">access_time</i> <span>Status</span></p>\r\n                <table class=\"simple\">\r\n                  <thead>\r\n                    <tr>\r\n                      <th class=\"info-table-row\"><b>Status</b></th>\r\n                      <th class=\"info-table-row\"><b>Date</b></th>\r\n                    </tr>\r\n                    <mat-divider></mat-divider>\r\n                    <tr>\r\n                      <th class=\"info-table-row\">Created</th>\r\n                      <th class=\"info-table-row\">{{shipment.date_added}}</th>\r\n                    </tr>\r\n                  </thead>\r\n                </table>\r\n              </div>\r\n              <div class=\"info-shipping\">\r\n                <p class=\"info-header\"><i class=\"material-icons\">airplanemode_active</i> <span>Shipping</span></p>\r\n              </div>\r\n            </div>\r\n          </mat-tab>\r\n\r\n          <mat-tab label=\"Items\">\r\n            <div class=\"shipment-item\">\r\n              <table class=\"simple\">\r\n                <thead>\r\n                  <tr>\r\n                    <th class=\"info-table-row\"><b>Name</b></th>\r\n                    <th class=\"info-table-row\"><b>Quantity</b></th>\r\n                    <th class=\"info-table-row\"><b>Item Price (Est.)</b></th>\r\n                    <th class=\"info-table-row\"><b>Weight (Total)</b></th>\r\n                  </tr>\r\n                  <mat-divider></mat-divider>\r\n                  <tr *ngFor=\"let item of items\">\r\n                    <th class=\"info-table-row\">{{item.item_name}}</th>\r\n                    <th class=\"info-table-row\">{{item.item_count}}</th>\r\n                    <th class=\"info-table-row\">{{item.item_price}}</th>\r\n                    <th class=\"info-table-row\">{{item.item_weight}}</th>\r\n                  </tr>\r\n                </thead>\r\n              </table>\r\n              <div class=\"item-total\">\r\n                <p>Total Price: ${{total_price}}</p>\r\n              </div>\r\n            </div>\r\n          </mat-tab>\r\n\r\n        </mat-tab-group>\r\n      </mat-card>\r\n    </div>\r\n  </div>\r\n</div>\r\n"

/***/ }),

/***/ "./src/app/views/shipments/shipment-detail/shipment-detail.component.scss":
/***/ (function(module, exports) {

module.exports = ".admin-toolbar a {\n  float: left;\n  padding-top: 8px;\n  padding-right: 1rem; }\n\n.admin-toolbar .material-icons {\n  font-size: 32px; }\n\n.shipment-detail table {\n  width: 100%; }\n\n.shipment-detail .shipment-header {\n  font-size: 20px;\n  font-family: 'Montserrat', sans-serif;\n  color: white;\n  position: absolute;\n  z-index: 1;\n  height: 168px;\n  width: 100%;\n  background-color: #6e2da8;\n  background-size: cover; }\n\n.shipment-detail .shipment-header p {\n    padding-top: 2rem;\n    padding-left: 4.5rem; }\n\n.shipment-detail .shipment-header a {\n    position: absolute;\n    z-index: 3; }\n\n.shipment-detail .shipment-header .material-icons {\n    font-size: 30px;\n    float: left;\n    padding-right: 1rem; }\n\n.shipment-detail .shipment-center {\n  z-index: 2;\n  position: relative;\n  width: 94%;\n  padding-top: 120px;\n  padding-left: 3%; }\n\n.shipment-detail .shipment-center .shipment-card {\n    height: 1100px;\n    padding: 0 !important;\n    -webkit-box-shadow: 0 8px 10px 1px rgba(0, 0, 0, 0.14), 0 3px 14px 2px rgba(0, 0, 0, 0.12), 0 5px 5px -3px rgba(0, 0, 0, 0.3);\n            box-shadow: 0 8px 10px 1px rgba(0, 0, 0, 0.14), 0 3px 14px 2px rgba(0, 0, 0, 0.12), 0 5px 5px -3px rgba(0, 0, 0, 0.3); }\n\n.shipment-detail .shipment-center .shipment-card .shipment-info {\n      padding: 1rem 2rem 1rem 2rem; }\n\n.shipment-detail .shipment-center .shipment-card .shipment-info .info-header {\n        font-size: 18px;\n        font-family: 'Montserrat', sans-serif; }\n\n.shipment-detail .shipment-center .shipment-card .shipment-info .info-header .material-icons {\n          padding-right: 10px !important; }\n\n.shipment-detail .shipment-center .shipment-card .shipment-info .info-address {\n        padding-top: 1rem;\n        height: 500px; }\n\n.shipment-detail .shipment-center .shipment-card .shipment-info .info-address .address-detail {\n          padding-top: 1.5rem;\n          font-family: 'Montserrat', sans-serif; }\n\n.shipment-detail .shipment-center .shipment-card .shipment-info .info-address .address-detail agm-map {\n            float: left;\n            width: 100%;\n            height: 350px;\n            padding-right: 1.5rem; }\n\n.shipment-detail .shipment-center .shipment-card .shipment-info .info-address .address-detail .address-map {\n            float: left;\n            width: 45%;\n            padding-right: 1.5rem; }\n\n.shipment-detail .shipment-center .shipment-card .shipment-info .info-address .address-detail .address-text {\n            width: 50%;\n            float: right;\n            text-align: left; }\n\n.shipment-detail .shipment-center .shipment-card .shipment-info .info-status {\n        padding-top: 1rem; }\n\n.shipment-detail .shipment-center .shipment-card .shipment-info .info-shipping {\n        padding-top: 1rem; }\n\n.shipment-detail .shipment-center .shipment-card .shipment-item {\n      padding: 1rem; }\n\n.shipment-detail .shipment-center .shipment-card .shipment-item .simple {\n        width: 100%; }\n\n.shipment-detail .shipment-center .shipment-card .shipment-item .item-total {\n        padding-top: 1rem;\n        width: 24%;\n        float: right; }\n\n.shipment-detail .shipment-center .shipment-card .shipment-item .info-table-row {\n        padding-bottom: 1.5rem !important; }\n\n.shipment-detail .shipment-center .shipment-card mat-tab {\n      height: 100px !important; }\n\n.shipment-detail .shipment-center .shipment-card .info-table-row {\n      padding: 10px;\n      text-align: left;\n      width: 19% !important;\n      font-weight: normal !important;\n      font-family: 'Montserrat', sans-serif; }\n\n.centered {\n  position: fixed;\n  top: 50%;\n  left: 50%;\n  /* bring your own prefixes */\n  -webkit-transform: translate(-50%, -50%);\n          transform: translate(-50%, -50%);\n  padding-left: 15rem; }\n\n.centered p {\n    font-size: 22px;\n    font-family: 'Montserrat', sans-serif;\n    padding-top: 1rem;\n    padding-left: 0rem; }\n"

/***/ }),

/***/ "./src/app/views/shipments/shipment-detail/shipment-detail.component.ts":
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, "a", function() { return ShipmentDetailComponent; });
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_0__angular_core__ = __webpack_require__("./node_modules/@angular/core/esm5/core.js");
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_1__services_connection_service__ = __webpack_require__("./src/app/services/connection.service.ts");
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_2__angular_router__ = __webpack_require__("./node_modules/@angular/router/esm5/router.js");
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_3__app_component__ = __webpack_require__("./src/app/app.component.ts");
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_4__angular_common_http__ = __webpack_require__("./node_modules/@angular/common/esm5/http.js");
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_5__angular_http__ = __webpack_require__("./node_modules/@angular/http/esm5/http.js");
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_6_rxjs_add_operator_map__ = __webpack_require__("./node_modules/rxjs/_esm5/add/operator/map.js");
var __decorate = (this && this.__decorate) || function (decorators, target, key, desc) {
    var c = arguments.length, r = c < 3 ? target : desc === null ? desc = Object.getOwnPropertyDescriptor(target, key) : desc, d;
    if (typeof Reflect === "object" && typeof Reflect.decorate === "function") r = Reflect.decorate(decorators, target, key, desc);
    else for (var i = decorators.length - 1; i >= 0; i--) if (d = decorators[i]) r = (c < 3 ? d(r) : c > 3 ? d(target, key, r) : d(target, key)) || r;
    return c > 3 && r && Object.defineProperty(target, key, r), r;
};
var __metadata = (this && this.__metadata) || function (k, v) {
    if (typeof Reflect === "object" && typeof Reflect.metadata === "function") return Reflect.metadata(k, v);
};







var ShipmentDetailComponent = (function () {
    function ShipmentDetailComponent(connection, ac, router, ar, client, http) {
        this.connection = connection;
        this.ac = ac;
        this.router = router;
        this.ar = ar;
        this.client = client;
        this.http = http;
        this.total_price = 0;
    }
    ShipmentDetailComponent.prototype.ngOnInit = function () {
        var _this = this;
        this.ar.params.subscribe(function (params) {
            _this.id = params.id;
        });
        console.log(this.id);
        this.getShipment(this.id);
    };
    ShipmentDetailComponent.prototype.getShipment = function (id) {
        var _this = this;
        this.connection.get(window.otto_data + '/dev.php/api/beta/shipments/' + id).subscribe(function (res) {
            console.log(res);
            _this.shipment = res.data;
            _this.s_lat = _this.shipment.s_latitude;
            _this.s_lng = _this.shipment.s_longitude;
            _this.r_lat = _this.shipment.r_latitude;
            _this.r_lng = _this.shipment.r_longitude;
            _this.connection.get(window.otto_data + '/dev.php/api/beta/customers/' + _this.shipment.user_id).subscribe(function (res) {
                _this.customer = res.data;
                console.log(_this.customer);
            });
            _this.connection.get(window.otto_data + '/dev.php/api/beta/shipments/' + id + '/items').subscribe(function (res) {
                _this.items = res.data;
                for (var _i = 0, _a = res.data; _i < _a.length; _i++) {
                    var item = _a[_i];
                    _this.total_price += parseFloat(item.total_price);
                }
                _this.total_price = _this.total_price.toFixed(2);
                console.log(_this.items);
            });
        });
    };
    ShipmentDetailComponent = __decorate([
        Object(__WEBPACK_IMPORTED_MODULE_0__angular_core__["n" /* Component */])({
            selector: 'app-shipment-detail',
            template: __webpack_require__("./src/app/views/shipments/shipment-detail/shipment-detail.component.html"),
            styles: [__webpack_require__("./src/app/views/shipments/shipment-detail/shipment-detail.component.scss")]
        }),
        __metadata("design:paramtypes", [__WEBPACK_IMPORTED_MODULE_1__services_connection_service__["a" /* ConnectionService */],
            __WEBPACK_IMPORTED_MODULE_3__app_component__["a" /* AppComponent */],
            __WEBPACK_IMPORTED_MODULE_2__angular_router__["b" /* Router */],
            __WEBPACK_IMPORTED_MODULE_2__angular_router__["a" /* ActivatedRoute */],
            __WEBPACK_IMPORTED_MODULE_4__angular_common_http__["b" /* HttpClient */],
            __WEBPACK_IMPORTED_MODULE_5__angular_http__["a" /* Http */]])
    ], ShipmentDetailComponent);
    return ShipmentDetailComponent;
}());



/***/ }),

/***/ "./src/app/views/shipments/shipments.component.css":
/***/ (function(module, exports) {

module.exports = "mat-row {\r\n    cursor: pointer;\r\n}\r\n"

/***/ }),

/***/ "./src/app/views/shipments/shipments.component.html":
/***/ (function(module, exports) {

module.exports = "<div class=\"content-container\">\r\n  <mat-toolbar class=\"admin-toolbar\">\r\n    <span>Shipments</span>\r\n  </mat-toolbar>\r\n  <div class=\"shipment-list\">\r\n    <mat-table #table [dataSource]=\"dataSource\">\r\n\r\n      <!--- Note that these columns can be defined in any shipment.\r\n        The actual rendered columns are set as a property on the row definition\" -->\r\n\r\n      <ng-container matColumnDef=\"id\">\r\n        <mat-header-cell *matHeaderCellDef> ID </mat-header-cell>\r\n        <mat-cell *matCellDef=\"let shipment\"> {{shipment.shipment_id}} </mat-cell>\r\n      </ng-container>\r\n\r\n      <ng-container matColumnDef=\"receiver_name\">\r\n        <mat-header-cell *matHeaderCellDef> Receiver Name </mat-header-cell>\r\n        <mat-cell *matCellDef=\"let shipment\"> {{shipment.receiver_name}} </mat-cell>\r\n      </ng-container>\r\n\r\n      <ng-container matColumnDef=\"receiver_address\">\r\n        <mat-header-cell *matHeaderCellDef> Address </mat-header-cell>\r\n        <mat-cell *matCellDef=\"let shipment\"> {{shipment.receiver_address}} - {{shipment.receiver_province}}, {{shipment.receiver_city}}</mat-cell>\r\n      </ng-container>\r\n\r\n      <ng-container matColumnDef=\"price\">\r\n        <mat-header-cell *matHeaderCellDef> Price </mat-header-cell>\r\n        <mat-cell *matCellDef=\"let shipment\"> {{shipment.payment}} </mat-cell>\r\n      </ng-container>\r\n\r\n      <ng-container matColumnDef=\"reference\">\r\n        <mat-header-cell *matHeaderCellDef> Reference </mat-header-cell>\r\n        <mat-cell *matCellDef=\"let shipment\"> {{shipment.reference}} </mat-cell>\r\n      </ng-container>\r\n\r\n      <mat-header-row *matHeaderRowDef=\"displayedColumns\"></mat-header-row>\r\n      <mat-row  *matRowDef=\"let row; columns: displayedColumns;\" (click)=\"navigate(row)\"></mat-row>\r\n\r\n    </mat-table>\r\n\r\n    <mat-paginator [length]=\"total\"\r\n            [pageSize]=\"per_page\"\r\n            [pageSizeOptions]=\"page_size\"\r\n            (page)=\"switchPage($event)\">\r\n    </mat-paginator>\r\n  </div>\r\n</div>\r\n"

/***/ }),

/***/ "./src/app/views/shipments/shipments.component.ts":
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, "a", function() { return ShipmentsComponent; });
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_0__angular_core__ = __webpack_require__("./node_modules/@angular/core/esm5/core.js");
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_1__services_connection_service__ = __webpack_require__("./src/app/services/connection.service.ts");
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_2__angular_router__ = __webpack_require__("./node_modules/@angular/router/esm5/router.js");
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_3__angular_material__ = __webpack_require__("./node_modules/@angular/material/esm5/material.es5.js");
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_4__app_component__ = __webpack_require__("./src/app/app.component.ts");
var __decorate = (this && this.__decorate) || function (decorators, target, key, desc) {
    var c = arguments.length, r = c < 3 ? target : desc === null ? desc = Object.getOwnPropertyDescriptor(target, key) : desc, d;
    if (typeof Reflect === "object" && typeof Reflect.decorate === "function") r = Reflect.decorate(decorators, target, key, desc);
    else for (var i = decorators.length - 1; i >= 0; i--) if (d = decorators[i]) r = (c < 3 ? d(r) : c > 3 ? d(target, key, r) : d(target, key)) || r;
    return c > 3 && r && Object.defineProperty(target, key, r), r;
};
var __metadata = (this && this.__metadata) || function (k, v) {
    if (typeof Reflect === "object" && typeof Reflect.metadata === "function") return Reflect.metadata(k, v);
};





var ShipmentsComponent = (function () {
    function ShipmentsComponent(connection, ac, router) {
        this.connection = connection;
        this.ac = ac;
        this.router = router;
        this.templates = [];
        this.shipments = [];
        this.total = 1;
        this.per_page = 10;
        this.page_size = [5, 10, 25, 50];
        this.pageIndex = 0;
        this.filter_search = '';
        this.displayedColumns = ['id', 'receiver_name', 'receiver_address', 'price', 'reference'];
        this.dataSource = new __WEBPACK_IMPORTED_MODULE_3__angular_material__["v" /* MatTableDataSource */]();
    }
    ShipmentsComponent.prototype.ngOnInit = function () {
        this.getShipments();
    };
    ShipmentsComponent.prototype.getShipments = function () {
        var _this = this;
        var url = window.otto_data + '/dev.php/api/beta/shipments';
        this.connection.get(url).subscribe(function (shipments) {
            for (var i = 0; i < shipments.data.length; i++) {
                var shipment = shipments.data[i];
                _this.shipments.push(shipment);
            }
            _this.total = _this.shipments.length;
            var start = _this.pageIndex * _this.per_page;
            _this.dataSource.data = _this.shipments.slice(start, (start + _this.per_page));
        });
    };
    ShipmentsComponent.prototype.switchPage = function ($event) {
        var list = this.shipments;
        var start = $event.pageIndex * $event.pageSize;
        this.per_page = $event.pageSize;
        this.pageIndex = this.pageIndex;
        this.dataSource.data = list.slice(start, (start + $event.pageSize));
    };
    ShipmentsComponent.prototype.navigate = function (row) {
        this.id = row.shipment_id;
        this.router.navigateByUrl('/shipments/' + this.id);
    };
    ShipmentsComponent = __decorate([
        Object(__WEBPACK_IMPORTED_MODULE_0__angular_core__["n" /* Component */])({
            selector: 'app-shipments',
            template: __webpack_require__("./src/app/views/shipments/shipments.component.html"),
            styles: [__webpack_require__("./src/app/views/shipments/shipments.component.css")]
        }),
        __metadata("design:paramtypes", [__WEBPACK_IMPORTED_MODULE_1__services_connection_service__["a" /* ConnectionService */],
            __WEBPACK_IMPORTED_MODULE_4__app_component__["a" /* AppComponent */],
            __WEBPACK_IMPORTED_MODULE_2__angular_router__["b" /* Router */]])
    ], ShipmentsComponent);
    return ShipmentsComponent;
}());



/***/ }),

/***/ "./src/app/views/sidebar/sidebar.component.html":
/***/ (function(module, exports) {

module.exports = "<div class=\"menu\">\r\n\t<div class=\"top-actions\">\r\n\t\t<div class=\"header noselect\">\r\n      OttoAir\r\n    </div>\r\n\t\t<mat-accordion>\r\n\t\t\t<mat-expansion-panel *ngFor=\"let item of items\">\r\n\t\t\t\t<mat-expansion-panel-header>\r\n\t\t\t\t\t<mat-panel-title>\r\n\t\t\t\t\t\t<mat-icon>{{ item.icon }}</mat-icon>\r\n\t\t\t\t\t\t<span>{{ item.name }}</span>\r\n\t\t\t\t\t</mat-panel-title>\r\n\t\t\t\t\t<mat-panel-description></mat-panel-description>\r\n\t\t\t\t</mat-expansion-panel-header>\r\n\t\t\t\t<mat-nav-list>\r\n\t\t\t\t\t<mat-list-item *ngFor=\"let link of item.sub\">\r\n\t\t\t\t\t\t<a mat-line (click)=\"navigate(link.link)\">\r\n\t\t\t\t\t\t\t<mat-icon>chevron_right</mat-icon>\r\n\t\t\t\t\t\t\t<span>{{ link.name }}</span>\r\n\t\t\t\t\t\t</a>\r\n\t\t\t\t\t</mat-list-item>\r\n\t\t\t\t</mat-nav-list>\r\n\t\t\t</mat-expansion-panel>\r\n\t\t</mat-accordion>\r\n\t</div>\r\n\t<!-- <div class=\"bottom-actions\" *ngIf=\"storeSelected()\"> -->\r\n\t<div class=\"bottom-actions\">\r\n\t\t<mat-nav-list>\r\n\t\t\t<mat-list-item>\r\n\t\t\t\t<mat-icon style=\"padding-left: 5px;\">tag_faces</mat-icon>\r\n\t\t\t\t<span style=\"padding-left: 0.5rem;\">{{admin}}</span>\r\n\t\t\t</mat-list-item>\r\n\t\t</mat-nav-list>\r\n\t</div>\r\n</div>\r\n"

/***/ }),

/***/ "./src/app/views/sidebar/sidebar.component.scss":
/***/ (function(module, exports) {

module.exports = ".menu {\n  background-color: #572087;\n  width: 250px;\n  height: 100vh;\n  display: -webkit-box;\n  display: -ms-flexbox;\n  display: flex;\n  -webkit-box-orient: vertical;\n  -webkit-box-direction: normal;\n      -ms-flex-direction: column;\n          flex-direction: column;\n  -webkit-box-pack: justify;\n      -ms-flex-pack: justify;\n          justify-content: space-between; }\n  .menu .header {\n    background-color: #4c1b77;\n    padding: 1rem 1rem;\n    font-family: 'Montserrat', sans-serif;\n    font-weight: bolder;\n    color: white;\n    padding-left: 2rem;\n    font-size: 1.7rem; }\n  .menu .header img {\n      max-height: 28px; }\n  .menu .noselect {\n    -webkit-touch-callout: none;\n    /* iOS Safari */\n    -webkit-user-select: none;\n    /* Safari */\n    /* Konqueror HTML */\n    -moz-user-select: none;\n    /* Firefox */\n    -ms-user-select: none;\n    /* Internet Explorer/Edge */\n    user-select: none;\n    /* Non-prefixed version, currently\r\n\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\tsupported by Chrome and Opera */ }\n  .menu .mat-expansion-panel:not([class*=mat-elevation-z]) {\n    padding-top: 0.5rem;\n    -webkit-box-shadow: none;\n            box-shadow: none;\n    background: none;\n    color: #FFF;\n    margin: 0; }\n  .menu .mat-expansion-panel:not([class*=mat-elevation-z]) mat-expansion-panel-header {\n      color: #FFF; }\n  .menu .mat-expansion-panel:not([class*=mat-elevation-z]) mat-expansion-panel-header .mat-expansion-indicator::after {\n        color: #FFF; }\n  .menu .mat-expansion-panel:not([class*=mat-elevation-z]) mat-expansion-panel-header mat-icon {\n        margin-right: 1rem;\n        color: #FFF; }\n  .menu .mat-expansion-panel:not([class*=mat-elevation-z]) mat-expansion-panel-header mat-panel-title span {\n        color: #FFF;\n        line-height: 1.8; }\n  .menu mat-nav-list {\n    padding: 0; }\n  .menu mat-nav-list mat-list-item {\n      color: #FFF;\n      background-color: rgba(255, 255, 255, 0.1); }\n  .menu mat-nav-list mat-list-item:hover {\n        background-color: rgba(0, 0, 0, 0.1); }\n  .menu mat-nav-list mat-list-item mat-icon {\n        color: #FFF; }\n  .menu mat-nav-list mat-list-item a {\n        font-size: 14px;\n        line-height: 1; }\n  .menu mat-nav-list mat-list-item a span {\n          position: relative;\n          top: -6px; }\n  .menu .bottom-actions {\n    background-color: #4c1b77; }\n  .menu .bottom-actions mat-nav-list mat-list-item {\n      background: none; }\n"

/***/ }),

/***/ "./src/app/views/sidebar/sidebar.component.ts":
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, "a", function() { return SidebarComponent; });
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_0__angular_core__ = __webpack_require__("./node_modules/@angular/core/esm5/core.js");
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_1__app_component__ = __webpack_require__("./src/app/app.component.ts");
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_2__angular_router__ = __webpack_require__("./node_modules/@angular/router/esm5/router.js");
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_3_ngx_cookie_service__ = __webpack_require__("./node_modules/ngx-cookie-service/index.js");
var __decorate = (this && this.__decorate) || function (decorators, target, key, desc) {
    var c = arguments.length, r = c < 3 ? target : desc === null ? desc = Object.getOwnPropertyDescriptor(target, key) : desc, d;
    if (typeof Reflect === "object" && typeof Reflect.decorate === "function") r = Reflect.decorate(decorators, target, key, desc);
    else for (var i = decorators.length - 1; i >= 0; i--) if (d = decorators[i]) r = (c < 3 ? d(r) : c > 3 ? d(target, key, r) : d(target, key)) || r;
    return c > 3 && r && Object.defineProperty(target, key, r), r;
};
var __metadata = (this && this.__metadata) || function (k, v) {
    if (typeof Reflect === "object" && typeof Reflect.metadata === "function") return Reflect.metadata(k, v);
};




var SidebarComponent = (function () {
    function SidebarComponent(ac, router, ar, cookie) {
        this.ac = ac;
        this.router = router;
        this.ar = ar;
        this.cookie = cookie;
        this.items = [
            {
                name: 'Customers',
                icon: 'face',
                link: 'customers',
                sub: [
                    { name: 'List', link: 'customers' },
                ]
            },
            {
                name: 'Flights',
                icon: 'airplanemode_active',
                link: 'flights',
                sub: [
                    { name: 'List', link: 'flights' },
                ]
            },
            {
                name: 'Shipments',
                icon: 'local_shipping',
                link: 'shipments',
                sub: [
                    { name: 'List', link: 'shipments' }
                ]
            },
            {
                name: 'Orders',
                icon: 'card_giftcard',
                link: 'orders',
                sub: [
                    { name: 'List', link: 'orders' }
                ]
            },
        ];
    }
    SidebarComponent.prototype.ngOnInit = function () {
        this.getAdmin();
    };
    SidebarComponent.prototype.getAdmin = function () {
        var cookieExists = this.cookie.get('OTTO_ADMIN');
        this.admin = "George";
    };
    SidebarComponent.prototype.navigate = function (link) {
        // let hash = this.router.url.replace(/^\/admin\/([a-z0-9]*)\/(.*)/g, '$1');
        this.router.navigateByUrl('/' + link);
    };
    SidebarComponent = __decorate([
        Object(__WEBPACK_IMPORTED_MODULE_0__angular_core__["n" /* Component */])({
            selector: 'app-sidebar',
            template: __webpack_require__("./src/app/views/sidebar/sidebar.component.html"),
            styles: [__webpack_require__("./src/app/views/sidebar/sidebar.component.scss")]
        }),
        __metadata("design:paramtypes", [__WEBPACK_IMPORTED_MODULE_1__app_component__["a" /* AppComponent */],
            __WEBPACK_IMPORTED_MODULE_2__angular_router__["b" /* Router */],
            __WEBPACK_IMPORTED_MODULE_2__angular_router__["a" /* ActivatedRoute */],
            __WEBPACK_IMPORTED_MODULE_3_ngx_cookie_service__["a" /* CookieService */]])
    ], SidebarComponent);
    return SidebarComponent;
}());



/***/ }),

/***/ "./src/environments/environment.ts":
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, "a", function() { return environment; });
// The file contents for the current environment will overwrite these during build.
// The build system defaults to the dev environment which uses `environment.ts`, but if you do
// `ng build --env=prod` then `environment.prod.ts` will be used instead.
// The list of which env maps to which file can be found in `.angular-cli.json`.
var environment = {
    production: false
};


/***/ }),

/***/ "./src/main.ts":
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
Object.defineProperty(__webpack_exports__, "__esModule", { value: true });
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_0__angular_core__ = __webpack_require__("./node_modules/@angular/core/esm5/core.js");
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_1__angular_platform_browser_dynamic__ = __webpack_require__("./node_modules/@angular/platform-browser-dynamic/esm5/platform-browser-dynamic.js");
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_2__app_app_module__ = __webpack_require__("./src/app/app.module.ts");
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_3__environments_environment__ = __webpack_require__("./src/environments/environment.ts");
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_4_hammerjs__ = __webpack_require__("./node_modules/hammerjs/hammer.js");
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_4_hammerjs___default = __webpack_require__.n(__WEBPACK_IMPORTED_MODULE_4_hammerjs__);





if (__WEBPACK_IMPORTED_MODULE_3__environments_environment__["a" /* environment */].production) {
    Object(__WEBPACK_IMPORTED_MODULE_0__angular_core__["_17" /* enableProdMode */])();
}
Object(__WEBPACK_IMPORTED_MODULE_1__angular_platform_browser_dynamic__["a" /* platformBrowserDynamic */])().bootstrapModule(__WEBPACK_IMPORTED_MODULE_2__app_app_module__["a" /* AppModule */])
    .catch(function (err) { return console.log(err); });


/***/ }),

/***/ 0:
/***/ (function(module, exports, __webpack_require__) {

module.exports = __webpack_require__("./src/main.ts");


/***/ })

},[0]);
//# sourceMappingURL=main.bundle.js.map