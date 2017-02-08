var list = [];

var dashboardApp = angular.module('hello', ['ui.router','ngTable'])
    .service('sharedProperties', function ($base64) {
        var spList=null;

        return{
            getspList: function(){
            return spList;
        },
            setspList: function (splist) {
                spList=splist;
            }
        }
    }

);


dashboardApp.config(function($stateProvider, $urlRouterProvider) {



    // For any unmatched url, redirect to /state1
    $urlRouterProvider

        .otherwise("/Dashboard");
     //.otherwise("/api1");

    $stateProvider
        .state('upload', {
            url: "/sp_file",
            templateUrl: "resources/angularJS/views/file.html",
            controller: "home"
        })
        .state('history', {
            url: "/sp_history",
            templateUrl: "resources/angularJS/views/history.html",
            controller: "history"
        })
        .state('jobHistory', {
            url: "/job_history",
            templateUrl: "resources/angularJS/views/jobHistory.html",
            controller: "jobHistory"
        })
        .state('list', {
            url: "/sp_list",
            templateUrl: "resources/angularJS/views/splist.html",
            controller: "SPfileUploadController"
        })
        .state('show', {
            url: "/sp_list",
            templateUrl: "resources/angularJS/views/show.jsp",
            controller: "ListController"
        })
        .state('filter', {
            url: "/filter",
            templateUrl: "resources/angularJS/views/filter.html",
            controller: "FilterController"
        })
});


dashboardApp.controller('home', function($scope) {


    $scope.jobhistory = function () {

        $scope.showTableFiltered = !$scope.showTableFiltered;

        /** @namespace $scope.jobNumber */
        console.debug("debug");
        $scope.filterNumber;
        $http.get('/filter?filterNum=' + $scope.filterNumber).
            success(function (response) {
                console.debug("debug2");
                $scope.filteredUsers = response.responseData;
                list = response.responseData;
                console.debug( $scope.filteredUsers);
            });


    };

});

dashboardApp.controller('jobHistory', function($scope,$http) {


    $scope.jobhistory = function () {

        $scope.jobTableFiltered = !$scope.jobTableFiltered;
        console.debug("debug");
        $http.get('/loghistory').
            success(function (response) {
                console.debug("debug2");
                $scope.filteredJobs = response.responseData;
                list = response.responseData;
                console.debug( $scope.filteredJobs);
            });

    };

});

dashboardApp.controller('history', function($scope,$http) {

    $scope.sphistory = function () {

        $scope.jobTableFiltered = !$scope.jobTableFiltered;

        /** @namespace $scope.jobNumber */
        console.debug("debug");
        $http.get('/loghistory').
            success(function (response) {
                console.debug("debug2");
                $scope.filteredJobs = response.responseData;
                list = response.responseData;
                console.debug( $scope.filteredJobs);
            });

    };

    $scope.jobdetails = function () {

        $scope.jobResult = !$scope.jobResult;

        $scope.filterNumber;
        console.debug("debug");
        $http.get('/jobSearch?spid=' + $scope.filterNumber).
            success(function (response) {
                console.debug("debug2");
                $scope.jobSearch = response.responseData;
                list = response.responseData;
                console.debug( $scope.jobSearch);
            });

    };





});


dashboardApp.controller('FilterController', function($scope,$http) {
   $scope.showTableFiltered = false;


    $scope.pdf = function () {
       // $(document).ready(function () {
        //     $('#PDF').tableExport({type: 'pdf', pdfFontSize: '7', escape: 'false'});
        //
        //     pdf.save('test.pdf');
        // });
        //// pdf.save('test1.pdf');

       // $scope.showTableFiltered = !$scope.showTableFiltered;


        console.debug("debug");
        $scope.filterNumber;
        $http.get('/filterpdf?spid=' + $scope.filterNumber).
            success(function (response) {
                console.debug("debug2");
                $scope.filteredUsers = response.responseData;
                list = response.responseData;
                console.debug( $scope.filteredUsers);

                var ret = [];
                ret.push('"' + Object.keys(list[0]).join('","') + '"');
                for (var i = 0, len = list.length; i < len; i++) {
                    var line = [];
                    for (var key in list[i]) {
                        if (list[i].hasOwnProperty(key)) {
                            line.push('"' + list[i][key] + '"');
                           // alert(ret.join('n'));
                           // alert(ret.join('\n'));
                           // var table = document.getElementById(ret).innerHTML;


                        }
                    }
                    ret.push(line.join(','));
                }

                var hiddenElement = document.createElement('a');

                hiddenElement.href = 'data:attachment/csv,' + encodeURI(ret.join('\n'));
                hiddenElement.target = '_blank';
                hiddenElement.download = 'myFile.csv';
                hiddenElement.click();
                return ret.join('\n');

            });


    };


        $scope.filter = function () {

            $scope.showTableFiltered = !$scope.showTableFiltered;

            /** @namespace $scope.jobNumber */
            console.debug("debug");
            $scope.filterNumber;
            $http.get('/filter?filterNum=' + $scope.filterNumber).
                success(function (response) {
                    console.debug("debug2");
                    $scope.filteredUsers = response.responseData;
                    list = response.responseData;
                    console.debug( $scope.filteredUsers);
                });


        };


    $scope.credit = function() {
        $http.get('/credit?creditNum=' + $scope.filterNumber).
            success(function (response) {

                $scope.creditedUsers = response.responseData;
            });


        $scope.selectedItems = [];

       /* $scope.$watch('filteredUsers', function(newValues){
            $scope.selectedItems.length = 0;
            angular.forEach(newValues, function(user) {
                if (user.id == true) {
                    $scope.selectedItems.push(user);
                }
            });
            console.log($scope.selectedItems);
        }, true);
*/

     /*   $("#filteredUsers tr").click(function(){
            $(this).addClass('selected').siblings().removeClass('selected');
            var value=$(this).find('td:first').html();
            alert(value);
        });*/

    };



});

dashboardApp.controller('SPfileUploadController', function($scope,$http) {
    $scope.jobNumber;

    $scope.createLog = function() {


        /** @namespace $scope.jobNumber */
        $scope.userPassword = {jobNum: $scope.jobNumber};

        $http.get('/spLog?jobNumber=' + $scope.jobNumber).
            success(function (response) {

            });
    };


        $scope.deleteLog = function() {


            /** @namespace $scope.jobNumber */


            $http.get('/clearLog?jobNumber=' + $scope.jobNumber).
                success(function (response) {

                });
        }

    });

dashboardApp.controller('ListController', function($scope,$http, $filter, ngTableParams) {


    $scope.users ="";
        /*$scope.users = [{"id":1,"first_name":"Philip","last_name":"Kim","email":"pkim0@mediafire.com","country":"Indonesia","ip_address":"29.107.35.8"},
            {"id":2,"first_name":"Judith","last_name":"Austin","email":"jaustin1@mapquest.com","country":"China","ip_address":"173.65.94.30"},
            {"id":3,"first_name":"Julie","last_name":"Wells","email":"jwells2@illinois.edu","country":"Finland","ip_address":"9.100.80.145"},
            {"id":4,"first_name":"Gloria","last_name":"Greene","email":"ggreene3@blogs.com","country":"Indonesia","ip_address":"69.115.85.157"},
        {"id":50,"first_name":"Andrea","last_name":"Greene","email":"agreene4@fda.gov","country":"Russia","ip_address":"128.72.13.52"}];
*/

    $scope.showTable = false;

    $scope.showLog = function () {

        $scope.showTable = !$scope.showTable;

        $http.get('/showLog').
            success(function (response) {
                $scope.users=response.responseData;
                console.log($scope.users);
            });
    };

    $scope.showLog();



  /*  $scope.usersTable = new ngTableParams({
        page: 1,
        count: 10
    }, {
        //total: $scope.users.length,
        getData: function ($defer, params) {
            $scope.data = $scope.users.slice((params.page() - 1) * params.count(), params.page() * params.count());
            $defer.resolve($scope.data);
        }
    });
*/
});

