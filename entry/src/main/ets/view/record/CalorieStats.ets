import { CommonConstants } from '../../common/constants/CommonConstants'

@Component
export  default struct CaloriesStats {
  intake:number=192 //饮食摄入量
  expend:number=150 //运动消耗量
  //推荐值recommend：其实应该是根据人的身高体重去计算出来 在这里我们先写死
  recommend:number=CommonConstants.RECOMMEND_CALORIE

  //还可以吃多少算法
  remainCalorie(){
    return this.recommend-this.intake+this.expend
  }

  build() {
    Row({space:CommonConstants.SPACE_6}){
      //1.饮食摄入
      this.StatsBuilder('饮食摄入',this.intake)
      // Column({space:CommonConstants.SPACE_6}){
      //   Text('饮食摄入')
      //     .fontColor($r('app.color.gray'))
      //     .fontWeight(CommonConstants.FONT_WEIGHT_600)
      //   Text('190')
      //     .fontSize(20)
      //     .fontWeight(CommonConstants.FONT_WEIGHT_700)
      // }
      //还可以吃
      //2.还可以吃多少是有算法的：
      //2.1进度条
      Stack(){
        Progress({
          value:this.intake,
          total:this.recommend,
          type:ProgressType.Ring //进度条为圆形
        })
          .width(120)
          .style({strokeWidth:CommonConstants.DEFAULT_10})//进度条的粗细
          .color($r('app.color.primary_color')) //进度条的颜色
        this.StatsBuilder('还可以吃',this.remainCalorie(),`推荐${this.recommend}`)
      }

      // Column({space:CommonConstants.SPACE_6}){
      //   Text('还可以吃')
      //     .fontColor($r('app.color.gray'))
      //     .fontWeight(CommonConstants.FONT_WEIGHT_600)
      //   Text('1384')
      //     .fontSize(20)
      //     .fontWeight(CommonConstants.FONT_WEIGHT_700)
      //   Text('推荐1692')
      //     .fontSize(12)
      //     .fontColor($r('app.color.light_gray'))
      // }
      //运动消耗
      //3.运动消耗
      this.StatsBuilder('运动消耗',this.expend)
      // Column({space:CommonConstants.SPACE_6}){
      //   Text('运动消耗')
      //     .fontColor($r('app.color.gray'))
      //     .fontWeight(CommonConstants.FONT_WEIGHT_600)
      //   Text('231')
      //     .fontSize(20)
      //     .fontWeight(CommonConstants.FONT_WEIGHT_700)
      // }
    }
    .width('100%')
    .justifyContent(FlexAlign.SpaceEvenly)
    .padding({top:30,bottom:35})
  }
  @Builder StatsBuilder(label:string,value:number,tips?:string){
    Column({space:CommonConstants.SPACE_6}){
      Text(label)
        .fontColor($r('app.color.gray'))
        .fontWeight(CommonConstants.FONT_WEIGHT_600)
      Text(value.toFixed(0))//value.toFixed(0)将number类型转换成string类型
        .fontSize(20)
        .fontWeight(CommonConstants.FONT_WEIGHT_700)
      if(tips){
        Text(tips)
          .fontSize(12)
          .fontColor($r('app.color.light_gray'))
      }
    }
  }
}