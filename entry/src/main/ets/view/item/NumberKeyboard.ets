import { CommonConstants } from '../../common/constants/CommonConstants'

@Component
export default struct NumberKeyboard {
  //按键与片数数值进行联动
  @Link amount: number
  @Link value: string
  //“删除”按钮与numbers中的按钮不一样所以我们要另外单独写“删除”按钮
  numbers: string[] = ['1', '2', '3', '4', '5', '6', '7', '8', '9', '0', '.']

  @Styles
  keyBoxStyle(){
    .backgroundColor(Color.White)
    .borderRadius(8)
    .height(60)
  }

  build() {
    Grid() {
      ForEach(this.numbers, num => {
        //数字按钮
        GridItem() {
          Text(num).fontSize(20).fontWeight(CommonConstants.FONT_WEIGHT_900)
        }.keyBoxStyle()
        .onClick(() => {
          this.clickNumber(num)
        })
      })
      //删除按钮
      GridItem() {
        Text('刪除').fontSize(20).fontWeight(CommonConstants.FONT_WEIGHT_900)
      }.keyBoxStyle().onClick(() => {
        this.clickDelete()
      })
    }
    .width('100%')
    .height(280) //Grid是根据总单元格的高度+总单元格行间距来设定的  总单元格的高度：5*60   总单元格行间距：5*8
    .backgroundColor($r('app.color.index_page_background'))
    .columnsTemplate('1fr 1fr 1fr') //只设置列为3列  每列所占高度比例1：1：1
    .columnsGap(8) //列间距
    .rowsGap(8) //行间距
    .padding(8)
    .margin({ top: 10 })
  }

  //给按键添加点击事件
  clickNumber(num: string) {
    //1,拼接用户输入的内容
    let val = this.value + num
    //2.校验输入格式是否正确
    let firstIndex = val.indexOf('.') //从前往后数第一个.的索引
    let lastIndex = val.lastIndexOf('.') //从后往前数第一个.的索引
    //firstIndex!==lastIndex保证只有一个.    lastIndex<val.length-2保证出现一位小数
    if (firstIndex !== lastIndex || (lastIndex != -1 && lastIndex < val.length - 2)) {
      //非法输入
      return
    }
    //3.将字符串转为数值
    let amount = this.parseFloat(val)
    //4.保存
    if (amount >= 999.9) {
      this.amount = 999.9
      this.value = '999'
    } else {
      this.amount = amount
      this.value = val
    }

  }

  //给删除按键添加点击事件
  clickDelete() {
    if (this.value.length <= 0) {
      this.value = ''
      this.amount = 0
      return
    }
    this.value = this.value.substring(0, this.value.length - 1)
    this.amount = this.parseFloat(this.value)
  }

  //防止用户输入的是2.的数值
  parseFloat(str: string) {
    if (!str) {
      return 0
    }
    if (str.endsWith('.')) {
      str = str.substring(0, str.length - 1)
    }
    return parseFloat(str)
  }
}