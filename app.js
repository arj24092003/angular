var app = angular.module('crudApp', []);

app.controller('crudController', function($scope) {

    $scope.users = [
        { id: 1, name: 'John Doe', email: 'john@example.com' },
        { id: 2, name: 'Jane Smith', email: 'jane@example.com' }
    ];

    $scope.addUser = function() {
        if ($scope.newUser.name && $scope.newUser.email) {    # function to add new user
            var newId = $scope.users.length + 1;
            $scope.users.push({
                id: newId,
                name: $scope.newUser.name,
                email: $scope.newUser.email
            });
            $scope.newUser = {};  // Reset the form
        }
    };

    $scope.deleteUser = function(id) {
        $scope.users = $scope.users.filter(function(user) {  #function to delete user
            return user.id !== id;
        });
    };


    $scope.editUser = function(user) {
        $scope.newUser = angular.copy(user);
        $scope.deleteUser(user.id);  // Remove the user being edited   #function to edit user
    };

});
