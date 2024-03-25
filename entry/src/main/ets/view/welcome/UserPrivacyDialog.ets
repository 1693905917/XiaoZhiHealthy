import { CommonConstants } from '../../common/constants/CommonConstants'

//加入@Preview即可预览当前页面样式
// @Preview
@CustomDialog
export struct UserPrivacyDialog {
  controller:CustomDialogController
  //组件传入对于函数类型参数，
  confirm:()=>void //同意事件
  cancel:()=>void  //不同意事件

  build() {
    Column({space:CommonConstants.SPACE_10}){
      //1.标题
      Text($r('app.string.user_privacy_title'))
        .fontSize(20)
        .fontWeight(CommonConstants.FONT_WEIGHT_700)
      //2.内容
      Text($r('app.string.user_privacy_content'))
      //3.按钮
      Button($r('app.string.agree_label'))
        .width(150)
        .backgroundColor($r('app.color.primary_color'))
        .onClick(()=>{
          this.confirm();
          this.controller.close();//弹窗关闭
        })
      Button($r('app.string.refuse_label'))
        .backgroundColor($r('app.color.lightest_primary_color'))
        .width(150)
        .fontColor($r('app.color.light_gray'))
        .onClick(()=>{
          this.cancel();
          this.controller.close();//弹窗关闭
        })
    }
    .width('100%')
    .padding(10)//将自定义弹窗内组件与边框的距离
  }
}