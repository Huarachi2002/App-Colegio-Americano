import 'package:colegio_americano/src/utils/RequestStatusEnum.dart';

class RequestStatus<T>{
  late RequestStatusEnum state;
  late String messageId;
  late T data;

  RequestStatus(this.state, this.messageId);

  RequestStatus.initialStateNull(){
    this.state = RequestStatusEnum.INITIAL;
    this.messageId = '';
  }

  RequestStatus.initialState(){
    this.state = RequestStatusEnum.LOADING;
    this.messageId = '';
  }

  RequestStatus.loadingState(){
    this.state = RequestStatusEnum.LOADING;
    this.messageId = '';
  }

  RequestStatus.errorState(String message){
    this.state = RequestStatusEnum.ERROR;
    this.messageId = message;
  }

  RequestStatus.emptyErrorState(){
    this.state = RequestStatusEnum.ERROR;
  }

  RequestStatus.successState(T data){
    this.state = RequestStatusEnum.SUCCESS;
    this.messageId = '';
    this.data = data;
  }

  RequestStatus.successStateEmpty(){
    this.state = RequestStatusEnum.SUCCESS;
    this.messageId = '';
  }
}