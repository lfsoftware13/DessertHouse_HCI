package homework.service;

import java.util.List;

import homework.model.Address;

public interface AddressService {
	
	
	/**
	 * @param memberid	用户id
	 * @param name	收货人姓名
	 * @param prov	省份
	 * @param city	市
	 * @param details	详细地址
	 * @param zip	邮编
	 * @param phone	手机
	 * @param isDefault	是否默认
	 * @return	操作是否成功
	 */
	public boolean addAddress(int memberid, String name, String prov, String city, String details, String zip, String phone, boolean isDefault);
	
	/**
	 * @param addressid	地址id
	 * @param name	收货人姓名
	 * @param prov	省份
	 * @param city	市
	 * @param details	详细地址
	 * @param zip	邮编
	 * @param phone	手机
	 * @param isDefault	是否有货
	 * @return	操作是否成功
	 */
	public boolean updateAddress(int addressid, String name, String prov, String city, String details, String zip, String phone, boolean isDefault);

	/**
	 * @param addressid 地址id
	 * @return 操作是否成功
	 */
	public boolean deleteAddress(int addressid);
	
	/**
	 * @param memberid 用户id
	 * @return 地址列表
	 */
	public List<Address> findAddress(int memberid); 
}
