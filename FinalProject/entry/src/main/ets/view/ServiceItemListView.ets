// 服务项目列表组件
import { ServiceItemType, ServiceItemList } from '../viewmodel/ServiceProcurementData';
import ServiceItemCard from './ServiceItemCard';

@Component
export default struct ServiceItemListView {
  onItemClick?: (item: ServiceItemType) => void;

  build() {
    Column() {
      List({ space: 12 }) {
        ForEach(ServiceItemList, (item: ServiceItemType) => {
          ListItem() {
            ServiceItemCard({
              serviceItem: item,
              onItemClick: (clickedItem: ServiceItemType) => {
                if (this.onItemClick) {
                  this.onItemClick(clickedItem);
                }
              }
            })
          }
        }, (item: ServiceItemType) => item.id.toString())
      }
      .width('100%')
      .height('100%')
      .padding({ left: '12vp', right: '12vp', top: '12vp', bottom: '12vp' })
    }
    .width('100%')
    .height('100%')
  }
}
