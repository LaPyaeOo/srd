class NullEmptyChecker{
  static bool checkVar(String str){
    if(str == null|| str == 'null'|| str == ''){
        return true;
    }
    else{
      return false;
    }
  }
}