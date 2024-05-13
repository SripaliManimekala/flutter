/**
 * Route Mappings
 * (sails.config.routes)
 *
 * Your routes tell Sails what to do each time it receives a request.
 *
 * For more information on configuring custom routes, check out:
 * https://sailsjs.com/anatomy/config/routes-js
 */

module.exports.routes = {

    'POST /api/v1/add-employee': { action: 'add-employee' },
    'GET /api/v1/get-all-employee': { action: 'get-all-employee' },
    'POST /api/v1/get-employee': { action: 'get-employee' },
    'POST /api/v1/delete-employee': { action: 'delete-employee'},
    'POST /api/v1/edit-employee': { action: 'edit-employee' }, 
    'GET /api/v1/get-sum-of-salary': { action: 'get-sum-of-salary' },
    'GET /api/v1/get-count-employee': { action: 'get-count-employee' },
    'GET /api/v1/get-all-department': { action: 'get-all-department' },
    'POST /api/v1/add-department': { action: 'add-department' },
    'GET /api/v1/emp-in-each-dep': { action: 'emp-in-each-dep' },
};
