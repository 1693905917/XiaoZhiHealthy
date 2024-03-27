import { CommonConstants } from '../../common/constants/CommonConstants'
import DateUtil from '../../common/utils/DateUtil'
import DatePickDialog from './DatePickDialog'

@Component
export  default  struct SearchHeader {



  build() {
    Row() {
      //对于搜索栏我们这边不是用inputText组件，而是Search组件
      Search({ placeholder: '搜索饮食或运动信息' })//placeholder:用于提示符
        .textFont({ size: 18 })//输入框内字体大小
        .layoutWeight(1)
      //Badge组件可以让你所要展示的图片上显示对应的信息提示：比如我们邮箱提示，右上角显示有多少个邮件
      //count:显示的数量    position：提示符出现在你的图片右上角  style：字体大小
      Badge({ count: 1, position: BadgePosition.RightTop, style: { fontSize: 12 } }) {
        Image($r('app.media.ic_public_email'))
          .width(24)
      }
    }.width(CommonConstants.THOUSANDTH_940)
  }
}