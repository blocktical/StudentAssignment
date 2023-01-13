// SPDX-License-Identifier: MIT
pragma solidity >=0.5.10;
contract StudentMarksheet {
    // global decleration
    address pAdd;
 
    struct studentMarksStructure {
        uint[] stubjectList;
        mapping( uint => uint ) subjectMarks;
        bool grade;
    }
 
    // studentID => studentMarksStructure
    mapping ( address => studentMarksStructure ) studentReport;
 
    //events decleration
    event eAddStudentSubjectMarks(address _studentID, uint _subjectID, uint _marks);
    event eStudentTotalMarks(address _studentID, uint _marks);
 
    // modifiers decleration
    modifier mCheckStudent(address _studentID){
        require(pAdd == msg.sender || _studentID == msg.sender,"You are not authorized.");
        _;
    }
 
    modifier mIsPrinciple {
        require(msg.sender == pAdd, "Your role is not recognised as a principle");
        _;
    }
 
    // constructor
    constructor(){
        pAdd = msg.sender;
    }
 
    // function set student subject mark
    function setStudentSubjectMark(address _studentID, uint _subjectID, uint _marks) public {
        studentReport[_studentID].stubjectList.push(_subjectID);
        studentReport[_studentID].subjectMarks[_subjectID] = _marks;
        emit eAddStudentSubjectMarks(_studentID,_subjectID,_marks);
    }
 
    // function get student subject mark
    function getStudentSubjectMark(address _studentID, uint _subjectID) public view returns(uint){
        return studentReport[_studentID].subjectMarks[_subjectID];
    }
 
    function getTotalMarks(address _studentID) public mCheckStudent(_studentID) returns(uint){
        uint length = studentReport[_studentID].stubjectList.length;
        uint totalMarks = 0;
        for(uint i = 0; i < length ; i++ ){
            totalMarks = studentReport[_studentID].subjectMarks[studentReport[_studentID].stubjectList[i]] + totalMarks;
        }
        emit eStudentTotalMarks(_studentID, totalMarks);
        return totalMarks;
    }
 
    function addGrade(address _studentID) public mIsPrinciple returns(bool){
        uint totalMarks = getTotalMarks(_studentID);
        // let consider one student appers in 2 exams only
        if( totalMarks >= 120){
            studentReport[_studentID].grade = true;
        }
        return studentReport[_studentID].grade;
    }
    
}
