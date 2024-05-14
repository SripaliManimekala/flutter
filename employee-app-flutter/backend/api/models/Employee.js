/**
 * Employee.js
 *
 * @description :: A model definition represents a database table/collection.
 * @docs        :: https://sailsjs.com/docs/concepts/models-and-orm/models
 */

module.exports = {

  tableName: "employee",
  attributes: {

    emp_code: {type:'string', required: true},
    emp_name: {type:'string', required: true},
    emp_email: { type: 'string', required: true, unique: true },
    emp_mobile: { type: 'string', allowNull: true },
    emp_salary: { type: 'number', columnType: 'decimal', required: true },
    department_id: {model: 'Department'},
    created_date: { type: 'ref', columnType: 'datetime', autoCreatedAt: true}
  },

};

