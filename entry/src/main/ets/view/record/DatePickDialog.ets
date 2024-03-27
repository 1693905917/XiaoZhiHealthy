import { CommonConstants } from '../../common/constants/CommonConstants'

@CustomDialog
export  default struct DatePickDialog{
  controller:CustomDialogController
  selectedDate:Date =new Date()  //获取当前时间
  build() {
    Column({space:CommonConstants.SPACE_12}) {
      //1.日期选择器
      DatePicker({
        start: new Date('2020-01-01'), //开始时间可以设置为本公司创建日期
        end: new Date(),  //用户查看饮食记录信息选择日期是只能从今天开始往以前的信息
        selected: this.selectedDate
      })
        .onChange((value: DatePickerResult) => {
          this.selectedDate.setFullYear(value.year, value.month, value.day)
        })
      //2.按钮
      Row({space:CommonConstants.SPACE_12}){
        Button('取消')
          .width(120)
          .backgroundColor($r('app.color.light_gray'))
          .onClick(()=>{
            this.controller.close()  //关闭弹窗
          })
        Button('确定')
          .width(120)
          .backgroundColor($r('app.color.primary_color'))
        //确定按钮是需要将selectedDate这个日期给它保存下来，那每次用户选中了以后呢，我们只是改变了selectedDate的值，而这个值将来在其他地方也要用到
        //那么我们如何将selectedDate这样的值，在这个应用内部的很多很多页面都能看到？
        //这个时候就要用到新的API：  AppStorage:整个应用的内部存储,它是在内存里面的，而且整个应用内部任何地方都可以去使用
          .onClick(()=>{
            //1.这里我们要将selectedDate日期给它保存到全局存储当中，这样我们才能在整个应用内部的任何地方都能看到
            AppStorage.SetOrCreate('selectedDate',this.selectedDate.getTime()) //如果键值对存在就覆盖  如果不存在就创建键值对
            //但是需要注意：我们不要把日期date对象存进去好  为什么呢？因为日期data对象将来去做这种状态变量监控的时候会有问题，比如在@state @ProperLink去对于日期类型对象做监控的时候会有报错
            //所以我们不存储日期，而是存储日期所对应的这个毫秒值，而毫秒值是在number类型，而number类型是可以被@state @ProperLink做监控  this.selectedDate.getTime()
            //提醒：AppStorage它本身就具备状态变量的一个功能就像@StorageProper @StorageLink一样，数据变化了就动态改变,可以用@StorageProper @StorageLink来进行读取
            //2.关闭窗口
            this.controller.close()
          })
      }
    }.padding(CommonConstants.SPACE_12)
  }
}