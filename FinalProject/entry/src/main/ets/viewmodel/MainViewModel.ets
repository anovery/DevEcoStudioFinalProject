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