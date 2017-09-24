export const addStudent = ({ dispatch },e) => {
    dispatch('ADD_STUDENT', e.target.value)
  }
  
  export const updateStudent = ({ dispatch }, e) => {
    dispatch('UPDATE_STUDENT', e.target.value)
  }
  
  export const addClass = ({ dispatch },e) => {
    dispatch('ADD_CLSS', e.target.value)
  }
  
