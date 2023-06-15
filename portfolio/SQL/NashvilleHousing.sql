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

select PropertyAddress
from NashVilleHousing

--PropertyAddress mix up the street address and city, we can seperate it into 2 columns
select SUBSTRING(PropertyAddress, 1, CHARINDEX(',',PropertyAddress)-1) StreetAddr,
SUBSTRING(PropertyAddress, CHARINDEX(',',PropertyAddress)+1, LEN(PropertyAddress)) City
from NashVilleHousing

alter table NashVilleHousing
add StreetAddress nvarchar(50)

update NashVilleHousing
set StreetAddress = SUBSTRING(PropertyAddress, 1, CHARINDEX(',',PropertyAddress)-1)

alter table NashVilleHousing
add City nvarchar(50)

update NashVilleHousing
set City = SUBSTRING(PropertyAddress, CHARINDEX(',',PropertyAddress)+1, LEN(PropertyAddress))

--owner address also mix up the street mumber, city, and state. Let's split them up.
--this time we use something else called 'parsename'. coz 'parsename' only work on period, 
--so we 'replace' the comma in the address with period
select PARSENAME(replace(OwnerAddress, ',','.'),3) StreetAddr,
PARSENAME(replace(OwnerAddress, ',','.'),2) City,
PARSENAME(replace(OwnerAddress, ',','.'),1) State
from PortfolioProjects..NashVilleHousing

--let's put the splited address to the table
alter table PortfolioProjects..NashVilleHousing
add OwnerStreetAddress nvarchar(50)

update PortfolioProjects..NashVilleHousing
set OwnerStreetAddress = PARSENAME(replace(OwnerAddress, ',','.'),3)

alter table PortfolioProjects..NashVilleHousing
add OwnerCity nvarchar(50)

update PortfolioProjects..NashVilleHousing
set OwnerCity = PARSENAME(replace(OwnerAddress, ',','.'),2)

alter table PortfolioProjects..NashVilleHousing
add OwnerState nvarchar(50)

update PortfolioProjects..NashVilleHousing
set OwnerState = PARSENAME(replace(OwnerAddress, ',','.'),1)

--For the column SoldAsVacant, some rows are 'Yes/No' while others are 'Y/N'. 
--Let's change the 'Y/N' to 'Yes/No'
select SoldAsVacant, COUNT(SoldAsVacant)
from PortfolioProjects..NashVilleHousing
group by SoldAsVacant
order by 2

--update PortfolioProjects..NashVilleHousing
--set SoldAsVacant = 'Yes'
--where SoldAsVacant = 'Y'

--update PortfolioProjects..NashVilleHousing
--set SoldAsVacant = 'No'
--where SoldAsVacant = 'N'

select SoldAsVacant 
, case 
	when SoldAsVacant = 'Y' then 'Yes'
	when SoldAsVacant = 'N' then 'No'
	else SoldAsVacant
  end
from PortfolioProjects..NashVilleHousing

update PortfolioProjects..NashVilleHousing
set SoldAsVacant = 
  case 
	when SoldAsVacant = 'Y' then 'Yes'
	when SoldAsVacant = 'N' then 'No'
	else SoldAsVacant
  end

--delete duplicated data
select * from PortfolioProjects..NashVilleHousing
--Find out the duplicate rows by counting the rows with same information
select *, ROW_NUMBER() over (partition by ParcelID, PropertyAddress, SalePrice, OwnerName,
OwnerAddress,TaxDistrict order by ParcelID) as Row_Num
from PortfolioProjects..NashVilleHousing

--use CTE to delete the duplicate rows
with DuplicateCTE as(
select *, ROW_NUMBER() over (partition by ParcelID, PropertyAddress, SalePrice, OwnerName,
OwnerAddress,TaxDistrict order by ParcelID) as Row_Num
from PortfolioProjects..NashVilleHousing
)
select * from DuplicateCTE
where Row_Num > 1

--drop the columns are useless(not recommended in the real database)
select * from PortfolioProjects..NashVilleHousing

alter table PortfolioProjects..NashVilleHousing
drop column PropertyAddress, OwnerAddress, TaxDistrict, SaleDate