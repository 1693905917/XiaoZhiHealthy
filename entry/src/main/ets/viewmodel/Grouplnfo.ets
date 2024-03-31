import ItemCategory from './ItemCategory'
import RecordItem from './RecordItem'

//创建该类来存储对应类型下的所有数据
export default  class GroupInfo{

  type:ItemCategory
  items:RecordItem[]

  constructor(type:ItemCategory,items:RecordItem[]) {
    this.type=type
    this.items=items
  }

}