import 'dart:math';
import 'package:prepicofeed/data/enums.dart';

class CmdWeek{

  String fishTyp, fishGro ;
  double? wtCoef;
  int? wt;
  int? fishNo;
  double? weightStart;
  double? weightEnd;
  double? biomas;
  double? feedWeightDay;

  CmdWeek( this.fishTyp,this.fishGro, this.wt,this.wtCoef, this.weightStart, this.fishNo){

    if(fishType.tilapia.name == fishTyp){
      if(fishGrow.growout.name == fishGro){
        _calcTilapiaGrowOut();
      }else{
        _calcTilapiaItermediate();
      }
    }else if(fishType.catfish.name == fishTyp){
      if(fishGrow.growout.name == fishGro){
        _calcCatfishGrowOut();
      }else{
        _calcCatfishItermediate();
      }
    }

  }

  _calcTilapiaItermediate(){
    double biomas_g = weightStart!*fishNo!;
    biomas = weightStart!*fishNo!/1000;
    double feedingRate = (-1.535*log(weightStart!) + 8.067);
    feedWeightDay = ((feedingRate/100) * wtCoef! * biomas_g)/1000;

    weightEnd = (weightStart! + getTilapiaTcjCoef(weightStart!)*7);

  }

  _calcTilapiaGrowOut(){
    double biomas_g = weightStart!*fishNo!;
    biomas = weightStart!*fishNo!/1000;
    double feedingRate = (-0.923*log(weightStart!) + 7.464);
    feedWeightDay = ((feedingRate/100) * wtCoef! * biomas_g)/1000;

    weightEnd = weightStart! + getTilapiaTcjCoef(weightStart!)*7;
  }

  double getTilapiaTcjCoef(double pm){

    if(0.02 <= pm && pm < 0.1) {
      return 0.15;
    }
    if(0.1 <= pm && pm < 0.5) {
      return 0.28;
    }
    if(0.5 <= pm && pm < 1) {
      return 0.39;
    }
    if(1 <= pm && pm < 2) {
      return 0.51;
    }
    if(2 <= pm && pm < 5) {
      return 0.70;
    }
    if(5 <= pm && pm < 20) {
      return 1.14;
    }
    if(20 <= pm && pm < 50) {
      return 2.08;
    }
    if(50 <= pm && pm < 100) {
      return 2.95;
    }
    if(100 <= pm && pm < 200) {
    return 3.58;
    }
    if(200 <= pm && pm < 300) {
    return 4.07;
    }
    if(300 <= pm && pm < 400) {
    return 4.48;
    }
    if(400 <= pm && pm < 500) {
    return 4.84;
    }
    if(500 <= pm && pm < 600) {
    return 4.84;
    }

    return 0;
  }


  _calcCatfishItermediate(){
    double biomas_g = weightStart!*fishNo!;
    biomas = weightStart!*fishNo!/1000;
    double feedingRate = (-1.013*log(weightStart!) + 7.9038);
    feedWeightDay = ((feedingRate/100) * wtCoef! * biomas_g)/1000;

    weightEnd = (weightStart! + getCatfishTcjCoef(weightStart!)*7);

  }

  _calcCatfishGrowOut(){
    double biomas_g = weightStart!*fishNo!;
    biomas = weightStart!*fishNo!/1000;
    double feedingRate = (-0.985*log(weightStart!) + 8.2062);
    feedWeightDay = ((feedingRate/100) * wtCoef! * biomas_g)/1000;

    weightEnd = weightStart! + getCatfishTcjCoef(weightStart!)*7;
  }

  double getCatfishTcjCoef(double pm){

    if(0.02 <= pm && pm < 0.1) {
      return 0.02;
    }
    if(0.1 <= pm && pm < 0.5) {
      return 0.06;
    }
    if(0.5 <= pm && pm < 1) {
      return 0.11;
    }
    if(1 <= pm && pm < 2) {
      return 0.18;
    }
    if(2 <= pm && pm < 5) {
      return 0.32;
    }
    if(5 <= pm && pm < 20) {
      return 0.78;
    }
    if(20 <= pm && pm < 50) {
      return 1.59;
    }
    if(50 <= pm && pm < 100) {
      return 2.31;
    }
    if(100 <= pm && pm < 200) {
      return 4.37;
    }
    if(200 <= pm && pm < 300) {
      return 6.23;
    }
    if(300 <= pm && pm < 400) {
      return 7.86;
    }
    if(400 <= pm && pm < 500) {
      return 9.36;
    }
    if(500 <= pm && pm < 600) {
      return 10.76;
    }

    return 0;
  }

}