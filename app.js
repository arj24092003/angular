var app = angular.module('crudApp', []);

app.controller('crudController', function($scope) {

    // Sample data for users
    $scope.users = [
        { id: 1, name: 'John Doe', email: 'john@example.com' },
        { id: 2, name: 'Jane Smith', email: 'jane@example.com' }
    ];

    // Function to add a new user
    $scope.addUser = function() {
        if ($scope.newUser.name && $scope.newUser.email) {
            var newId = $scope.users.length + 1;
            $scope.users.push({
                id: newId,
                name: $scope.newUser.name,
                email: $scope.newUser.email
            });
            $scope.newUser = {};  // Reset the form
        }
    };

    // Function to delete a user
    $scope.deleteUser = function(id) {
        $scope.users = $scope.users.filter(function(user) {
            return user.id !== id;
        });
    };

    // Function to edit a user
    $scope.editUser = function(user) {
        $scope.newUser = angular.copy(user);
        $scope.deleteUser(user.id);  // Remove the user being edited
    };

});
