import { CommonConstants } from '../../common/constants/CommonConstants'

@Component
export default struct NutrientStats {
  // 碳水化合物（克）
  carbon: number = 23
  // 蛋白质（克）
  protein: number = 9
  // 脂肪（克】
  fat: number = 7
  recommendCarbon: number = CommonConstants.RECOMMEND_CARBON
  recommendProtein: number = CommonConstants.RECOMMEND_PROTEIN
  recommendFat: number = CommonConstants.RECOMMEND_FAT

  build() {
    Row({ space: CommonConstants.SPACE_6 }) {
      //1.碳水化合物
      this.StatsBuilder(
        '碳水化合物',
        this.carbon,
        this.recommendCarbon,
        $r('app.color.carbon_color'))
      this.StatsBuilder(
        '蛋白质',
        this.protein,
        this.recommendProtein,
        $r('app.color.protein_color'))
      this.StatsBuilder(
        '脂肪',
        this.fat,
        this.recommendFat,
        $r('app.color.fat_color'))
    }
    .width('100%')
    .justifyContent(FlexAlign.SpaceEvenly)
    .padding({ top: 30, bottom: 35 })
  }

  @Builder
  StatsBuilder(label: string, value: number, recommend: number, color: Resource) {
    Column({ space: CommonConstants.SPACE_6 }) {
      Stack() {
        Progress({
          value: value,
          total: recommend,
          type: ProgressType.Ring //进度条为圆形
        })
          .width(95)
          .style({ strokeWidth: CommonConstants.DEFAULT_10 })//进度条的粗细
          .color(color)
        Column({ space: CommonConstants.SPACE_6 }) {
          Text('摄入推荐')
            .fontSize(12)
            .fontColor($r('app.color.light_gray'))
          Text(`${value.toFixed(0)}/${recommend.toFixed(0)}`)
            .fontSize(18)
            .fontWeight(CommonConstants.FONT_WEIGHT_600)
        }
      }

      Text(`${label} (克)`)
        .fontSize(12)
        .fontColor($r('app.color.light_gray'))
    }
  }
}