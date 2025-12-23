// 看护人员数据模型

// 看护人员信息接口
export interface CaregiverInfo {
  id: string;           // 看护人员ID
  name: string;         // 姓名
  title: string;        // 职称
  organization: string; // 所属机构
  phone: string;        // 联系电话
  specialties: string[]; // 专业领域
}

// 看护人员演示数据列表
const caregiverDataList: CaregiverInfo[] = [
  {
    id: 'cg_001',
    name: '李静',
    title: '主管护师',
    organization: '中山大学展示中心',
    phone: '13620240001',
    specialties: ['体检服务', '生命体征监测']
  },
  {
    id: 'cg_002',
    name: '张婷婷',
    title: '康复治疗师',
    organization: '康复理疗中心',
    phone: '13620240002',
    specialties: ['肢体功能训练', '康复评估']
  },
  {
    id: 'cg_003',
    name: '王芳',
    title: '国家注册营养师',
    organization: '营养药膳中心',
    phone: '13620240003',
    specialties: ['营养配餐', '饮食指导']
  },
  {
    id: 'cg_004',
    name: '陈丽华',
    title: '高级护理员',
    organization: '康养服务中心',
    phone: '13620240004',
    specialties: ['生活照护', '日常陪护']
  }
];

// 获取看护人员列表
export function getCaregiverList(): CaregiverInfo[] {
  return caregiverDataList;
}

// 根据ID获取看护人员信息
export function getCaregiverById(id: string): CaregiverInfo | undefined {
  return caregiverDataList.find(caregiver => caregiver.id === id);
}
