module.exports = {


  friendlyName: 'Add department',


  description: '',


  inputs: {
    dep_code: {type:'string', required: true},
    dep_name: { type: 'string', required: true },
  },


  exits: {},


  fn: async function (inputs, exits) {

    let check_department = await Department.findOne({dep_name:  inputs.dep_name});

    if(check_department) {
      return exits.success({
        status: false,
        error: "Department with the same name exists"
      });
    }

    const new_department = await Department.create({
      dep_code:  inputs.dep_code,
      dep_name:  inputs.dep_name,
    }).fetch();

    return exits.success({
      status: true,
      department: new_department
    });

  }


};
