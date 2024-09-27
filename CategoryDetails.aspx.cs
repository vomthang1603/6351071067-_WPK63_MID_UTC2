using System;
using System.Linq;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace de1
{
    public partial class CategoryDetails : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                int categoryId;
                if (int.TryParse(Request.QueryString["CategoryID"], out categoryId))
                {
                    BindBeverages(categoryId);
                }
            }
        }

        private void BindBeverages(int categoryId)
        {
            using (var context = new QLDoUongEntities())
            {
                var beverages = from b in context.Beverages
                                where b.CatID == categoryId
                                select new
                                {
                                    b.ID,
                                    b.Name,
                                    b.Description,
                                    b.Price,
                                    b.ImageFilePath
                                };

                ListViewBeverages.DataSource = beverages.ToList();
                ListViewBeverages.DataBind();
            }
        }

        protected void ListViewBeverages_PagePropertiesChanging(object sender, PagePropertiesChangingEventArgs e)
        {
            DataPager pager = (ListViewBeverages.FindControl("DataPagerBeverages") as DataPager);
            pager.SetPageProperties(e.StartRowIndex, e.MaximumRows, false);

            int categoryId;
            if (int.TryParse(Request.QueryString["CategoryID"], out categoryId))
            {
                BindBeverages(categoryId);
            }
        }
    }
}