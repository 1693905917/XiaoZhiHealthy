import router from '@ohos.router'
import { CommonConstants } from '../common/constants/CommonConstants'
import ItemCard from '../view/item/ItemCard'
import ItemList from '../view/item/ItemList'
import ItemPanelHeader from '../view/item/ItemPanelHeader'
import NumberKeyboard from '../view/item/NumberKeyboard'

@Entry
@Component
struct ItemIndex {
  //监控用户输入的数量值
  @State amount: number = 1
  //用于存储拼接用户输入的数值
  @State value: string = ''
  @State showPanel: boolean = false

  onPanelShow() {
    //初始化
    this.amount = 1
    this.value = ''
    this.showPanel = true //Panel组件传入的参数：ture：开启面板  false:关闭面板
  }

  build() {
    Column() {
      //1.头部导航
      this.Header()
      //2.列表
      ItemList({
        showPanel: this.onPanelShow.bind(this)
      })//注意：为什么要加layoutWeight(1)  原因：Panel:它其实是不占高度的,它是浮在表面的 但是它有个要求：就是它所在的容器高度以及它里边元素的高度都是固定的
        .layoutWeight(1)
      //3.底部面板
      Panel(this.showPanel) {
        //3.1.顶部日期
        ItemPanelHeader()
        //3.2.记录项卡片
        ItemCard({ amount: this.amount })
        //3.3.数字键盘
        NumberKeyboard({ amount: $amount, value: $value })
        //3.5.按钮
        Row({ space: CommonConstants.SPACE_6 }) {
          Button('取消')
            .width(120)
            .backgroundColor($r('app.color.light_gray'))
            .type(ButtonType.Normal)
            .borderRadius(6)
            .onClick(() => this.showPanel = false)
          Button('提交')
            .width(120)
            .backgroundColor($r('app.color.primary_color'))
            .type(ButtonType.Normal)
            .borderRadius(6)
            .onClick(() => this.showPanel = false)
        }.margin({ top: 10 })

      }
      .mode(PanelMode.Full) //设置控制面板所占手机屏幕的高度比例
      .dragBar(false) //是否可以自动调节控制面板所占手机屏幕的高度比例
      .backgroundMask($r('app.color.light_gray')) //设置控制面板浮在某个页面上，对于页面背景的模糊背景
      .backgroundColor(Color.White)
    }
    .width('100%')
    .height('100%')
  }

  //头部导航样式
  @Builder
  Header() {
    Row() {
      Image($r('app.media.ic_public_back'))
        .width(24)
        .onClick(() => router.back())
      Blank()
      Text('早餐').fontSize(18).fontWeight(CommonConstants.FONT_WEIGHT_600)
    }
    .width(CommonConstants.THOUSANDTH_940)
    .height(32)
  }
}