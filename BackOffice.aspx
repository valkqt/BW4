<%@ Page Title="" Language="C#" MasterPageFile="~/Template.Master" AutoEventWireup="true" MaintainScrollPositionOnPostback="true" CodeBehind="BackOffice.aspx.cs" Inherits="BW4.BackOffice" EnableEventValidation="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
</asp:Content>
<asp:Content ID="BackOffice" ContentPlaceHolderID="BackOffice" runat="server">

    <main class="BackOfficeWrapper">
        <div runat="server" id="ErrorBox" visible="false" enableviewstate="false" class="AlertMsg">
            <div class="alert alert-danger d-flex align-items-center" role="alert">
                <svg xmlns="http://www.w3.org/2000/svg" class="bi bi-exclamation-triangle-fill flex-shrink-0 me-2" viewBox="0 0 16 16" width="16" height="16" role="img" aria-label="Warning:">
                    <path d="M8.982 1.566a1.13 1.13 0 0 0-1.96 0L.165 13.233c-.457.778.091 1.767.98 1.767h13.713c.889 0 1.438-.99.98-1.767L8.982 1.566zM8 5c.535 0 .954.462.9.995l-.35 3.507a.552.552 0 0 1-1.1 0L7.1 5.995A.905.905 0 0 1 8 5zm.002 6a1 1 0 1 1 0 2 1 1 0 0 1 0-2z" />
                </svg>
                <div class="BackAlert">
                    <asp:Label ID="lbl_error" runat="server" Text="Error: "></asp:Label>
                    <asp:LinkButton ID="AlertClose" runat="server" OnClick="CloseAlert" CssClass="btn btn-danger">
                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-x-lg" viewBox="0 0 16 16">
                         <path d="M2.146 2.854a.5.5 0 1 1 .708-.708L8 7.293l5.146-5.147a.5.5 0 0 1 .708.708L8.707 8l5.147 5.146a.5.5 0 0 1-.708.708L8 8.707l-5.146 5.147a.5.5 0 0 1-.708-.708L7.293 8z"/>
                        </svg>
                    </asp:LinkButton>
                </div>
            </div>

        </div>
        <div runat="server" id="SuccessBox" visible="false" enableviewstate="false" class="AlertMsg">
            <div class="alert alert-info d-flex align-items-center" role="alert">
                <svg xmlns="http://www.w3.org/2000/svg" class="bi bi-exclamation-triangle-fill flex-shrink-0 me-2" viewBox="0 0 16 16" width="16" height="16" role="img" aria-label="Warning:">
                    <path d="M8.982 1.566a1.13 1.13 0 0 0-1.96 0L.165 13.233c-.457.778.091 1.767.98 1.767h13.713c.889 0 1.438-.99.98-1.767L8.982 1.566zM8 5c.535 0 .954.462.9.995l-.35 3.507a.552.552 0 0 1-1.1 0L7.1 5.995A.905.905 0 0 1 8 5zm.002 6a1 1 0 1 1 0 2 1 1 0 0 1 0-2z" />
                </svg>
                <div class="BackAlert">
                    <asp:Label ID="lbl_success" runat="server" Text="Successfully added new product"></asp:Label>
                    <asp:LinkButton ID="AlertClose2" runat="server" OnClick="CloseAlert" CssClass="btn btn-success">
                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-x-lg" viewBox="0 0 16 16">
                         <path d="M2.146 2.854a.5.5 0 1 1 .708-.708L8 7.293l5.146-5.147a.5.5 0 0 1 .708.708L8.707 8l5.147 5.146a.5.5 0 0 1-.708.708L8 8.707l-5.146 5.147a.5.5 0 0 1-.708-.708L7.293 8z"/>
                        </svg>
                    </asp:LinkButton>
                </div>
            </div>
        </div>

        <div class="BackAddButtonBox">

            <button type="button" class="BackButton" data-bs-toggle="modal" data-bs-target="#exampleModal2">
                Add Product
            </button>
            <!-- Modal -->
            <div class="modal fade" id="exampleModal2" tabindex="-1" aria-labelledby="exampleModalLabel2" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h1 class="modal-title fs-5" id="exampleModalLabel2">Modal title</h1>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body ">
                            <div class="BackAddInputBox">
                                <asp:Label ID="addlbl_title" runat="server" Text="Title:"></asp:Label>
                                <asp:TextBox ID="add_title" runat="server"></asp:TextBox>
                            </div>
                            <div class="BackAddInputBox">
                                <asp:Label ID="addlbl_price" runat="server" Text="Price:"></asp:Label>
                                <asp:TextBox ID="add_price" runat="server"></asp:TextBox>
                            </div>
                            <div class="BackAddInputBox">
                                <asp:Label ID="addlbl_category" runat="server" Text="Category:"></asp:Label>
                                <asp:TextBox ID="add_category" runat="server"></asp:TextBox>
                            </div>
                            <div class="BackAddInputBox">
                                <asp:Label ID="addlbl_description" runat="server" Text="Description:"></asp:Label>
                                <asp:TextBox ID="add_description" runat="server"></asp:TextBox>
                            </div>

                            <div class="BackAddInputBox">
                                <asp:Label ID="addlbl_brand" runat="server" Text="Brand:"></asp:Label>
                                <asp:TextBox ID="add_brand" runat="server"></asp:TextBox>
                            </div>
                            <div class="BackAddInputBox">
                                <asp:Label ID="addlbl_discount" runat="server" Text="Discount:"></asp:Label>
                                <asp:TextBox ID="add_discount" runat="server"></asp:TextBox>
                            </div>
                            <div class="BackAddInputBox">
                                <asp:Label ID="addlbl_images" runat="server" Text="Image:"></asp:Label>
                                <asp:TextBox ID="add_images" runat="server"></asp:TextBox>
                            </div>
                            <div class="BackAddInputBox">
                                <asp:Label ID="addlbl_stock" runat="server" Text="In Stock:"></asp:Label>
                                <asp:TextBox ID="add_stock" runat="server"></asp:TextBox>
                            </div>

                        </div>
                        <div class="modal-footer">
                            <asp:Button ID="OKButton" runat="server" Text="Close" CssClass="BackButton" />
                            <asp:Button ID="AddButton" runat="server" CssClass="BackButton" OnClick="AddButton_Click" Text="Submit" />
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <asp:GridView ID="GridView1" runat="server"
            AutoGenerateColumns="False" CellPadding="4" OnRowCancelingEdit="GridView1_RowCancelingEdit"
            OnRowEditing="GridView1_RowEditing" OnRowUpdating="GridView1_RowUpdating" OnRowDeleting="GridView1_RowDeleting" ForeColor="#333333" GridLines="None" CssClass="BackTable">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:Button ID="btn_Edit" runat="server" Text="Edit" CommandName="Edit" CssClass="BackButton" />
                    </ItemTemplate>
                    <EditItemTemplate>
                        <div class="BackButtonsFlex">
                            <asp:Button ID="btn_Update" runat="server" Text="Update" CommandName="Update" CssClass="BackButton" />
                            <asp:Button ID="btn_Cancel" runat="server" Text="Cancel" CommandName="Cancel" CssClass="BackButton" />
                            <asp:Button ID="btn_Delete" runat="server" Text="Delete" CommandName="Delete" CssClass="BackButton" />
                        </div>
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Id">
                    <ItemTemplate>
                        <asp:Label ID="lbl_id" runat="server" Text='<%#Eval("id") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Product">
                    <ItemTemplate>
                        <asp:Label ID="lbl_title" runat="server" Text='<%#Eval("title") %>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="lbl_title" runat="server" Text='<%#Eval("title") %>'></asp:TextBox>
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Price">
                    <ItemTemplate>
                        <asp:Label ID="lbl_price" runat="server" Text='<%#Eval("price", "{0:0.00}") %>' CssClass="BackPseudoElementEuro"></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="lbl_price" runat="server" Text='<%#Eval("price", "{0:0.00}") %>' CssClass="BackPseudoElementEuro"></asp:TextBox>
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Description">
                    <ItemTemplate>
                        <asp:Label ID="lbl_description" runat="server" Text='<%#Eval("description") %>' CssClass="BackTitleCase"></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="lbl_description" runat="server" Text='<%#Eval("description") %>' CssClass="BackTitleCase"></asp:TextBox>
                    </EditItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Category">
                    <ItemTemplate>
                        <asp:Label ID="lbl_category" runat="server" Text='<%#Eval("category") %>' CssClass="BackTitleCase"></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="lbl_category" runat="server" Text='<%#Eval("category") %>' CssClass="BackTitleCase"></asp:TextBox>
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Brand">
                    <ItemTemplate>
                        <asp:Label ID="lbl_brand" runat="server" Text='<%#Eval("brand") %>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="lbl_brand" runat="server" Text='<%#Eval("brand") %>'></asp:TextBox>
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Discount">
                    <ItemTemplate>
                        <asp:Label ID="lbl_discount" runat="server" Text='<%#Eval("discountPercentage") %>' CssClass="BackPseudoElement"></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="lbl_discount" runat="server" Text='<%#Eval("discountPercentage") %>' CssClass="BackPseudoElement"></asp:TextBox>
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Image">
                    <ItemTemplate>
                        <asp:Image runat="server" ID="lbl_image" ImageUrl='<%#Eval("images") %>' CssClass="BackImage" />
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="lbl_image" runat="server" Text='<%#Eval("images") %>'></asp:TextBox>
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="In Stock">
                    <ItemTemplate>
                        <asp:Label ID="lbl_stock" runat="server" Text='<%#Eval("stock") %>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="lbl_stock" runat="server" Text='<%#Eval("stock") %>'></asp:TextBox>
                    </EditItemTemplate>
                </asp:TemplateField>


            </Columns>
            <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#EF4D48" ForeColor="#ffffff" Font-Bold="True" />
            <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
            <RowStyle BackColor="#edcecd" ForeColor="#333333" />
            <SelectedRowStyle BackColor="#D8C0E4" Font-Bold="True" ForeColor="Navy" />
            <SortedAscendingCellStyle BackColor="#FDF5AC" />
            <SortedAscendingHeaderStyle BackColor="#4D0000" />
            <SortedDescendingCellStyle BackColor="#FCF6C0" />
            <SortedDescendingHeaderStyle BackColor="#820000" />
        </asp:GridView>
    </main>
</asp:Content>
