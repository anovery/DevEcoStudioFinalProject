//封装主页面所需要的所有数据源
import ItemData from './ItemData';

export class MainViewModel{
  //轮播图数据源配置
  getSwiperImages(): Array<Resource>{
    let swiperImages:Resource[]=[
      $r('app.media.home1'),
      $r('app.media.home2'),
      $r('app.media.home3')
    ];
    return swiperImages;
  }

  //宫格导航数据源配置
  getFirstGridData():Array<ItemData>{
    let FirstGridData:ItemData[]=[
      new ItemData(0,'问诊记录',$r('app.media.home4')),
      new ItemData(1,'服务订单',$r('app.media.home5')),
      new ItemData(2,'服务采购',$r('app.media.home6')),
      new ItemData(3,'入住申请',$r('app.media.home7'))
    ]
    return FirstGridData;
  }
}

export default new MainViewModel();

//健康宣教的数据
export class HealthResourcesItemType {
  ResourceName: string;
  ResourcePhoto: Resource;


  constructor(ResourceName: string, ResourcePhoto: Resource) {
    this.ResourceName = ResourceName;
    this.ResourcePhoto = ResourcePhoto;

  }
}

export const HealthResourcesList: HealthResourcesItemType[] = [
  new HealthResourcesItemType('高血压',$r('app.media.health_resource1')),
  new HealthResourcesItemType('骨质增生',$r('app.media.health_resource4')),
  new HealthResourcesItemType('老年痴呆', $r('app.media.health_resource3')),
  new HealthResourcesItemType('帕金森', $r('app.media.health_resource2'))
]