import { CommonConstants } from '../../common/constants/CommonConstants'

@Component
export default struct ItemPanelHeader {
  build() {
    Row(){
      //TODO 用户点击切换早、中、晚餐  时间是动态显示
      Text('2024年3月30日 早餐')
        .fontSize(18).fontWeight(CommonConstants.FONT_WEIGHT_600)
      Image($r('app.media.ic_public_spinner'))
        .width(20)
        .fillColor(Color.Black)
    }
  }
}