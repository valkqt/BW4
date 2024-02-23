namespace BW4
{
    public class Queries
    {
        private static string _categories = @"WITH RankedProducts AS (
                                                SELECT
                                                    id,
                                                    title, 
                                                    category,
                                                    images,
                                                    price,
                                                    ROW_NUMBER() OVER (PARTITION BY p.category ORDER BY NEWID()) AS RowNum
                                                FROM 
                                                    Products p
                                                )
                                            SELECT TOP 6 id, category, title, images, price 
                                            FROM 
                                                RankedProducts
                                            WHERE 
                                                RowNum = 1
                                            ORDER BY NEWID();";



        private static string _newArrivals = @"SELECT TOP 4 * FROM Products ORDER BY NEWID()";
        private static string _specialDeals = @"SELECT TOP 2 * FROM Products ORDER BY discountPercentage desc;";
        public static string Categories
        {
            get
            {
                return _categories;
            }
        }
        public static string NewArrivals
        {
            get
            {
                return _newArrivals;
            }
        }

        public static string SpecialDeals
        {
            get
            {
                return _specialDeals;
            }
        }
    }
}