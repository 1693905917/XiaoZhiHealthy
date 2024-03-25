import router from '@ohos.router'
import common from '@ohos.app.ability.common'
import PreferenceUtil from '../common/utils/PreferenceUtil'
import { UserPrivacyDialog } from '../view/welcome/UserPrivacyDialog'

@Extend(Text)
//fontSize: number = 10如果不给值就用默认值10
function opacityWhiteText(opacity: number, fontSize: number = 10) {
  .fontSize(fontSize)
  .opacity(opacity)//文字透明度设置
  .fontColor(Color.White)
}
const PREF_KEY='userPrivacyKey'
@Entry
@Component
struct WelcomePage {
  controller:CustomDialogController =new CustomDialogController({
    builder:UserPrivacyDialog({ confirm:()=>this.onConfirm(), cancel:()=>this.exitApp()})
  })
  context = getContext(this) as common.UIAbilityContext
 async  aboutToAppear(){
    //1.加载首选项
    let isAgree= await PreferenceUtil.getPreferenceValue(PREF_KEY,false)
    //2.判断是否同意
   if(isAgree){
     //2.1.同意,跳转首页
     this.jumpToIndex()
   }else {
     //2.2不同意,弹窗
     this.controller.open()
   }
  }
  //同意操作
  onConfirm(){
    //1.保存首选项
    PreferenceUtil.putPreferenceValue(PREF_KEY,true)
    //2.跳转到首页
    this.jumpToIndex()
  }
  //不同意操作
  exitApp(){
    //退出APP
    this.context.terminateSelf()
  }
  //跳转并且替代当前页面到index页面
  jumpToIndex(){
    setTimeout(()=>{ //设置跳转延迟时间  为数据缓存
      router.replaceUrl({
        url:'pages/Index'
      })
    },1000)
  }

  build() {
    Column({space:10}) {//添加组件之间的间隙
      //1.中央slogan
      Row(){
        Image($r('app.media.home_slogan')).width(260)
      }
      .layoutWeight(1) //布局权重:让它一个人占剩下的所有空间
      //2.logo
      Image($r('app.media.home_logo')).width(150)

      //3.文字描述
      Row(){
        Text('小志健康支持').opacityWhiteText(0.8,12)
          // .fontSize(12)
          // .opacity(0.8)//文字透明度设置
          // .fontColor(Color.White)
        Text('IPv6')
          //border设置边框样式  style:BorderStyle.Solid：设置边框是实线
          .border({style:BorderStyle.Solid,width:1,color:Color.White,radius:15})
          .padding({left:5,right:5}) //设置内边距：IPv6与边框的距离
          .opacityWhiteText(0.8)
          // .fontSize(10)
          // .opacity(0.8)//文字透明度设置
          // .fontColor(Color.White)
        Text('网络').opacityWhiteText(0.8,12)
          // .fontSize(12)
          // .opacity(0.8).fontColor(Color.White)//文字透明度设置.fontColor(Color.White)
      }
      Text(`'减更多'指小志健康App希望通过软件工具的形式，帮助更多用户实现身材管理`).opacityWhiteText(0.6)
        // .fontSize(10)
        // .opacity(0.6)//文字透明度设置
        // .fontColor(Color.White)
      Text('浙ICP备0000000号-36D').opacityWhiteText(0.4)
        // .fontSize(10)
        // .opacity(0.4)
        // .fontColor(Color.White)//文字透明度设置.fontColor(Color.White)
        .margin({bottom:35}) //给最后一个文本添加一个外边距
    }
    .height('100%')
    .width('100%')
    //设置整个页面的背景颜色
    .backgroundColor($r('app.color.welcome_page_background'))
  }
}