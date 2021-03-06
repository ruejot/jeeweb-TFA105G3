package com.memfollow.model;

import java.util.List;


public interface MemFollowDAO_interface {
	public abstract void insert(MemFollowVO memFollowBean);
	public abstract void update(MemFollowVO memFollowBean);
	public abstract void delete(Integer memberId,Integer followee);
	public abstract MemFollowVO findByPrimaryKey(Integer friendshipId);
	public abstract List<MemFollowVO> getAll();
//	public abstract List<MemFollowVO> getAllByMemberId(Integer memberId);
	public abstract List<MemFollowVO> getAllByFollowee(Integer followee);
	public abstract MemFollowVO ifFriend(Integer memberId, Integer followee);
}
