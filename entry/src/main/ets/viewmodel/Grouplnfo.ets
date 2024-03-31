import ItemCategory from './ItemCategory'
import RecordItem from './RecordItem'

//创建该类来存储对应类型下的所有数据
export default  class GroupInfo<TYPE, ELEMENT>{

  /**
   * 分组类型
   */
  type:TYPE
  /**
   * 组内数据集合
   */
  items:ELEMENT[]

  /**
   * 组内纪录的热量
   */
  calorie:number

  constructor(type:TYPE,items:ELEMENT[]) {
    this.type=type
    this.items=items
  }

}