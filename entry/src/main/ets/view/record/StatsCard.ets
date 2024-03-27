import { CommonConstants } from '../../common/constants/CommonConstants'
import DateUtil from '../../common/utils/DateUtil'
import DatePickDialog from './DatePickDialog'

@Component
export  default struct StatsCard{

  //利用StorageProp进行加载读取
  //注意这里的如果我们new Date()这个日期会加上今天的时分秒
  //而我们在DatePickDialog文件中的selectedDate存储的只有年-月-日相当于对应的就是当前日期的0时0分0秒
  //所以要保持一致，也都用上当前日期的0时0分0秒
  //利用我们工具包中的DateUtil的beginTimeOfDay可以解决这个问题
  @StorageProp('selectedDate') selectedDate:number=DateUtil.beginTimeOfDay(new Date())
  controller:CustomDialogController=new CustomDialogController({
    builder:DatePickDialog({selectedDate:new Date(this.selectedDate)})
  })

  build() {
    Column(){
      //1.日期信息
     Row(){
       Text(DateUtil.formatDate(this.selectedDate))//DateUtil.formatDate将毫秒值转换成日期值
         .fontColor($r('app.color.secondary_color'))
       Image($r('app.media.ic_public_spinner'))
         .width(20)
         .fillColor($r('app.color.secondary_color'))
     }
      .padding(CommonConstants.SPACE_8)
      .onClick(()=>{  //给日期信息添加点击事件，使得自定义弹窗组件打开
        this.controller.open()
      })
      //2.统计信息
      Swiper() {
          Text('hello')
            .width('90%')
            .height(160)
            .backgroundColor(0xAFEEEE)
            .textAlign(TextAlign.Center)
            .fontSize(30)
        Text('world')
          .width('90%')
          .height(160)
          .backgroundColor(0xAFEEEE)
          .textAlign(TextAlign.Center)
          .fontSize(30)
      }

    }
    .width(CommonConstants.THOUSANDTH_940)
    .backgroundColor($r('app.color.stats_title_bgc'))//背景颜色
    .borderRadius(CommonConstants.DEFAULT_18) //设计卡片四个角的形状
  }
}