@Extend(Text)
//fontSize: number = 10如果不给值就用默认值10
function opacityWhiteText(opacity: number, fontSize: number = 10) {
  .fontSize(fontSize)
  .opacity(opacity)//文字透明度设置
  .fontColor(Color.White)
}
@Entry
@Component
struct WelcomePage {
  @State message: string = 'Hello World'
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