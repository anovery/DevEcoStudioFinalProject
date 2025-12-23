// 服务采购相关数据模型

// 费用明细项接口
export interface FeeItem {
  name: string;
  price: number;
}

// 服务项目数据传递接口（用于页面间参数传递）
export interface IServiceItemData {
  id: number;
  serviceName: string;
  serviceOrganization: string;
  serviceType: string;
  servicePhoto: Resource;
  servicePrice: number;
  serviceUnit: string;
  serviceDescription: string;
  serviceDetails: string;
  serviceAppointmentNotice: string;
  serviceFeeNotice: string;
  feeBreakdown?: FeeItem[];
}

// 服务订单数据接口
export interface ServiceOrder {
  id: number;
  serviceType: string;       // 服务类型（检查）
  carePersonName: string;    // 被看护人
  serviceNumber: string;     // 服务单号
  caregiverId: string;       // 看护人员ID
  caregiverName?: string;    // 看护人员姓名(冗余字段,便于显示)
  appointmentTime: string;   // 预约时间
  servicePrice: number;      // 服务价格
  status: string;            // '待服务', '待评价', '已完成'
}


// 服务项目数据类型
export class ServiceItemType {
  id: number;
  serviceName: string;
  serviceOrganization: string;  // 服务机构
  serviceType: string;  // 服务类型
  servicePhoto: Resource;
  servicePrice: number;
  serviceUnit: string;
  serviceDescription: string;
  serviceDetails: string;
  serviceAppointmentNotice: string;  // 预约须知
  serviceFeeNotice: string;  // 费用须知
  feeBreakdown?: FeeItem[]; // 费用明细

  constructor(
    id: number,
    serviceName: string,
    serviceOrganization: string,
    serviceType: string,
    servicePhoto: Resource,
    servicePrice: number,
    serviceUnit: string,
    serviceDescription: string,
    serviceDetails: string,
    serviceAppointmentNotice: string,
    serviceFeeNotice: string,
    feeBreakdown?: FeeItem[]
  ) {
    this.id = id;
    this.serviceName = serviceName;
    this.serviceOrganization = serviceOrganization;
    this.serviceType = serviceType;
    this.servicePhoto = servicePhoto;
    this.servicePrice = servicePrice;
    this.serviceUnit = serviceUnit;
    this.serviceDescription = serviceDescription;
    this.serviceDetails = serviceDetails;
    this.serviceAppointmentNotice = serviceAppointmentNotice;
    this.serviceFeeNotice = serviceFeeNotice;
    this.feeBreakdown = feeBreakdown;
  }
}

// 预约信息表单数据类型
export class AppointmentFormType {
  serviceId: number;
  serviceName: string;
  patientId: string;
  patientName: string;
  caregiverId: string;
  appointmentTime: string;
  contactPerson: string;
  contactPhone: string;
  address: string;
  remarks: string;

  constructor(
    serviceId: number = 0,
    serviceName: string = '',
    patientId: string = '',
    patientName: string = '',
    caregiverId: string = '',
    appointmentTime: string = '',
    contactPerson: string = '',
    contactPhone: string = '',
    address: string = '',
    remarks: string = ''
  ) {
    this.serviceId = serviceId;
    this.serviceName = serviceName;
    this.patientId = patientId;
    this.patientName = patientName;
    this.caregiverId = caregiverId;
    this.appointmentTime = appointmentTime;
    this.contactPerson = contactPerson;
    this.contactPhone = contactPhone;
    this.address = address;
    this.remarks = remarks;
  }
}

// 服务项目列表数据
export const ServiceItemList: ServiceItemType[] = [
  new ServiceItemType(
    7,
    '检查',
    '测试检查机构',
    '检查',
    $r('app.media.service_item'),
    36,
    '次',
    '检查：心率、血压、血脂。',
    '检查：心率、血压、血脂。',
    '请提前预约，空腹。',
    '费用包含出诊、技术及耗材费用。详见下方费用明细。',
    [
      { name: '出诊费', price: 12 },
      { name: '技术费', price: 12 },
      { name: '耗材费', price: 12 }
    ]
  ),
  new ServiceItemType(
    1,
    '基础生活照护',
    '康养服务中心',
    '日常照护',
    $r('app.media.service_item'),
    120,
    '次',
    '为康养用户提供日常生活照护服务',
    '服务内容包括：协助起床、洗漱、穿衣、进食、如厕、移动等日常生活活动。专业护工上门服务，确保康养用户生活质量。',
    '请提前1天预约，服务时间为每天8:00-18:00。如需取消或改期，请提前24小时通知。',
    '费用不包含交通费，特殊节假日价格上浮20%。首次预约享受9折优惠。',
    [
      { name: '生活护理费', price: 100 },
      { name: '服务管理费', price: 20 }
    ]
  ),
  new ServiceItemType(
    2,
    '专业护理服务',
    '健康护理中心',
    '医疗护理',
    $r('app.media.service_item'),
    200,
    '次',
    '提供专业的医疗护理服务',
    '服务内容包括：测量生命体征、协助用药、伤口护理、管道护理、康复训练等专业护理服务。由持证护士提供，确保护理质量和安全。',
    '请提前2天预约，需提供医生诊断证明。护士将携带专业医疗器械上门。',
    '费用包含基础护理用品，特殊耗材需另行收费。可使用医保支付部分项目。',
    [
      { name: '专业护理费', price: 150 },
      { name: '器械耗材费', price: 50 }
    ]
  ),
  new ServiceItemType(
    3,
    '康复训练服务',
    '康复理疗中心',
    '康复训练',
    $r('app.media.service_item'),
    180,
    '次',
    '个性化康复训练方案',
    '服务内容包括：肢体功能训练、平衡能力训练、步行训练、关节活动度训练等。由专业康复师制定个性化训练方案，帮助康养用户恢复身体功能。',
    '请提前1天预约，首次需进行康复评估。建议每周2-3次，持续训练效果更佳。',
    '首次评估费用另计50元，购买10次套餐享受8.5折优惠。',
    [
      { name: '康复指导费', price: 120 },
      { name: '设备使用费', price: 60 }
    ]
  ),
  new ServiceItemType(
    4,
    '心理慰藉服务',
    '心理健康中心',
    '心理关怀',
    $r('app.media.service_item'),
    150,
    '次',
    '专业心理关怀与陪伴',
    '服务内容包括：心理疏导、情感陪伴、兴趣活动辅导、认知训练等。帮助康养用户保持良好的心理状态，提高生活质量。',
    '请提前1天预约，每次服务时长约2小时。提供一对一专属心理咨询服务。',
    '费用包含基础活动材料，特殊道具需另行收费。首月体验价8折。',
    [
      { name: '心理咨询费', price: 150 }
    ]
  ),
  new ServiceItemType(
    5,
    '营养配餐服务',
    '营养药膳中心',
    '营养配餐',
    $r('app.media.service_item'),
    100,
    '次',
    '专业营养师定制健康饮食',
    '服务内容包括：根据康养用户身体状况制定营养餐食方案、协助进食、饮食指导等。确保康养用户获得均衡营养，促进健康恢复。',
    '请提前1天预约，需提供用户健康档案和饮食禁忌。可预订每日三餐配送服务。',
    '费用包含配餐和配送，食材为当日新鲜采购。订购月套餐享受9折优惠。',
    [
      { name: '营养餐费', price: 80 },
      { name: '配送费', price: 20 }
    ]
  ),
  new ServiceItemType(
    6,
    '健康监测服务',
    '智慧健康中心',
    '健康管理',
    $r('app.media.service_item'),
    80,
    '次',
    '定期健康状况监测',
    '服务内容包括：血压、血糖、心率、体温等生命体征监测，健康数据记录与分析，异常情况及时反馈。帮助家属实时了解康养用户健康状况。',
    '请提前1天预约，建议每周监测1-2次。监测数据将同步至家属手机APP。',
    '费用包含基础监测项目，特殊检查项目需另行收费。办理年卡享受6折优惠。',
    [
      { name: '健康监测费', price: 60 },
      { name: '数据分析费', price: 20 }
    ]
  )
];
