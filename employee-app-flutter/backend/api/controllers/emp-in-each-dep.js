module.exports = {


  friendlyName: 'Emp in each dep',


  description: '',


  inputs: {

  },


  exits: {

  },


  fn: async function (inputs,exits) {

    const departments = await Department.find().populate('employees');

    let emp_count_each = departments.map((dep)=>({
      depId: dep.id,
      empCount: dep.employees.length
    }));

    return exits.success({
      count: emp_count_each
    });

  }


};
