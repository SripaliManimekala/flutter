/**
 * Department.js
 *
 * @description :: A model definition represents a database table/collection.
 * @docs        :: https://sailsjs.com/docs/concepts/models-and-orm/models
 */

module.exports = {
 
  tableName: "department",
  attributes: {


    dep_code: {type:'string', required: true},
    dep_name: { type: 'string', required: true },
    employees: {
      collection: 'Employee',
      via: 'department_id'
    }

  },

};

