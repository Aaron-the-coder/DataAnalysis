select * from NashVilleHousing

--format salesdate
select saledate, CONVERT(date, saledate)
from NashVilleHousing

alter table NashVilleHousing
add FormattedSaleDate date

update NashVilleHousing
set FormattedSaleDate = CONVERT(date, saledate)

select PropertyAddress
from NashVilleHousing
where PropertyAddress is null

select * from NashVilleHousing
order by ParcelID

select a.ParcelID, a.PropertyAddress, b.ParcelID, b.PropertyAddress
from NashVilleHousing a
join NashVilleHousing b
on a.ParcelID = b.ParcelID
and a.[UniqueID ] != b.[UniqueID ] --have the same Parcel ID but different UniqueID, meaning different row
where a.PropertyAddress is null --a propertyAddress is null, b propertyAddress will not be null

update a
set a.PropertyAddress = ISNULL(a.PropertyAddress, b.PropertyAddress)
from NashVilleHousing a
join NashVilleHousing b
on a.ParcelID = b.ParcelID
and a.[UniqueID ] != b.[UniqueID ] --have the same Parcel ID but different UniqueID, meaning different row
where a.PropertyAddress is null