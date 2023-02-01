 <?php $__env->startSection('content'); ?>
<?php if(session()->has('not_permitted')): ?>
  <div class="alert alert-danger alert-dismissible text-center"><button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button><?php echo e(session()->get('not_permitted')); ?></div> 
<?php endif; ?>
<section class="forms">
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-12">
                <div class="card">
                    <div class="card-header d-flex align-items-center">
                        <h4><?php echo e(trans('file.Add Purchase')); ?></h4>
                    </div>
                    <div class="card-body">
                        <p class="italic"><small><?php echo e(trans('file.The field labels marked with * are required input fields')); ?>.</small></p>
                        <?php echo Form::open(['route' => 'purchases.store', 'method' => 'post', 'files' => true, 'id' => 'purchase-form']); ?>

                        <div class="row">
                            <div class="col-md-12">
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label><?php echo e(trans('file.Warehouse')); ?> *</label>
                                            <input type="hidden" name="warehouse_id_hidden" value="<?php echo e($lims_quotation_data->warehouse_id); ?>" />
                                            <select required name="warehouse_id" class="selectpicker form-control" data-live-search="true" data-live-search-style="begins" title="انتخاب انبار...">
                                                <?php $__currentLoopData = $lims_warehouse_list; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $warehouse): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                                <option value="<?php echo e($warehouse->id); ?>"><?php echo e($warehouse->name); ?></option>
                                                <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label><?php echo e(trans('file.Supplier')); ?></label>
                                            <input type="hidden" name="supplier_id_hidden" value="<?php echo e($lims_quotation_data->supplier_id); ?>" />
                                            <select name="supplier_id" class="selectpicker form-control" data-live-search="true" id="supplier-id" data-live-search-style="begins" title="انتخاب تامین کننده...">
                                                <?php $__currentLoopData = $lims_supplier_list; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $supplier): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                                <option value="<?php echo e($supplier->id); ?>"><?php echo e($supplier->name .' ('. $supplier->company_name .')'); ?></option>
                                                <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label><?php echo e(trans('file.Purchase Status')); ?></label>
                                            <select name="status" class="form-control">
                                                <option value="1"><?php echo e(trans('file.Recieved')); ?></option>
                                                <option value="2"><?php echo e(trans('file.Partial')); ?></option>
                                                <option value="3"><?php echo e(trans('file.Pending')); ?></option>
                                                <option value="4"><?php echo e(trans('file.Ordered')); ?></option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label><?php echo e(trans('file.Attach Document')); ?></label>
                                            <i class="dripicons-question" data-toggle="tooltip" title="فقط فایلهای jpg ، jpeg ، png ، gif ، pdf ، csv ، docx ، xlsx و txt پشتیبانی می شوند"></i> 
                                            <input type="file" name="document" class="form-control" />
                                            <?php if($errors->has('extension')): ?>
                                                <span>
                                                   <strong><?php echo e($errors->first('extension')); ?></strong>
                                                </span>
                                            <?php endif; ?>
                                        </div>
                                    </div>
                                    <div class="col-md-12 mt-3">
                                        <label><?php echo e(trans('file.Select Product')); ?></label>
                                        <div class="search-box input-group">
                                            <button type="button" class="btn btn-secondary"><i class="fa fa-barcode"></i></button>
                                            <input type="text" name="product_code_name" id="lims_productcodeSearch" placeholder="لطفا کد کالا را تایپ کنید و ..." class="form-control" />
                                        </div>
                                    </div>
                                </div>
                                <div class="row mt-5">
                                    <div class="col-md-12">
                                        <h5><?php echo e(trans('file.Order Table')); ?> *</h5>
                                        <div class="table-responsive mt-3">
                                            <table id="myTable" class="table table-hover order-list">
                                                <thead>
                                                    <tr>
                                                        <th><?php echo e(trans('file.name')); ?></th>
                                                        <th><?php echo e(trans('file.Code')); ?></th>
                                                        <th><?php echo e(trans('file.Quantity')); ?></th>
                                                        <th class="recieved-product-qty d-none"><?php echo e(trans('file.Recieved')); ?></th>
                                                        <th><?php echo e(trans('file.Net Unit Cost')); ?></th>
                                                        <th><?php echo e(trans('file.Discount')); ?></th>
                                                        <th><?php echo e(trans('file.Tax')); ?></th>
                                                        <th><?php echo e(trans('file.Subtotal')); ?></th>
                                                        <th><i class="dripicons-trash"></i></th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <?php 
                                                    $temp_unit_name = [];
                                                    $temp_unit_operator = [];
                                                    $temp_unit_operation_value = [];
                                                    ?>
                                                    <?php $__currentLoopData = $lims_product_quotation_data; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $product_quotation): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                                    <?php 
                                                        $product_data = DB::table('products')->find($product_quotation->product_id);

                                                        if($product_quotation->variant_id) {
                                                            $product_variant_data = \App\ProductVariant::select('item_code')->FindExactProduct($product_quotation->product_id, $product_quotation->variant_id)->first();
                                                            
                                                            $product_data->code = $product_variant_data->item_code;
                                                        }
                                                    ?>
                                                    <?php if($product_data->type == 'standard'): ?>
                                                    <tr>
                                                        <?php
                                                            $product_cost = $product_data->cost;
                                                            $tax_data = DB::table('taxes')->where('rate', $product_quotation->tax_rate)->first();
                                                            $units = DB::table('units')->where('base_unit', $product_data->unit_id)->orWhere('id', $product_data->unit_id)->get();

                                                            $unit_name = array();
                                                            $unit_operator = array();
                                                            $unit_operation_value = array();

                                                            foreach($units as $unit) {
                                                                if($product_quotation->sale_unit_id == $unit->id) {
                                                                    array_unshift($unit_name, $unit->unit_name);
                                                                    array_unshift($unit_operator, $unit->operator);
                                                                    array_unshift($unit_operation_value, $unit->operation_value);
                                                                }
                                                                else {
                                                                    $unit_name[]  = $unit->unit_name;
                                                                    $unit_operator[] = $unit->operator;
                                                                    $unit_operation_value[] = $unit->operation_value;
                                                                }
                                                            }
                                                            if ($unit_operator[0] == '*') {
                                                                $row_product_cost = $product_cost * $unit_operation_value[0];
                                                            } else {
                                                                $row_product_cost = $product_cost / $unit_operation_value[0];
                                                            }
                                                            if($product_data->tax_method == 1){
                                                                $net_unit_cost = ($product_data->cost * $unit_operation_value[0]) - ($product_quotation->discount / $product_quotation->qty);
                                                                $tax = $net_unit_cost * $product_quotation->qty * ($product_quotation->tax_rate / 100);
                                                                $sub_total = ($net_unit_cost * $product_quotation->qty) + $tax;
                                                            }
                                                            else{
                                                                $sub_total_unit = ($product_data->cost * $unit_operation_value[0]) - ($product_quotation->discount / $product_quotation->qty);
                                                                $net_unit_cost = (100 / (100 + $product_quotation->tax_rate)) * $sub_total_unit;
                                                                $tax = ($sub_total_unit - $net_unit_cost) * $product_quotation->qty;
                                                                $sub_total = $sub_total_unit * $product_quotation->qty;
                                                            }
                                                            
                                                            $temp_unit_name = $unit_name = implode(",",$unit_name) . ',';

                                                            $temp_unit_operator = $unit_operator = implode(",",$unit_operator) .',';

                                                            $temp_unit_operation_value = $unit_operation_value =  implode(",",$unit_operation_value) . ',';
                                                        ?>
                                                        <td><?php echo e($product_data->name); ?> <button type="button" class="edit-product btn btn-link" data-toggle="modal" data-target="#editModal"> <i class="dripicons-document-edit"></i></button> </td>
                                                        <td><?php echo e($product_data->code); ?></td>
                                                        <td><input type="number" class="form-control qty" name="qty[]" value="<?php echo e($product_quotation->qty); ?>" step="any" required /></td>
                                                        <td class="recieved-product-qty d-none"><input type="number" class="form-control recieved" name="recieved[]" value="<?php echo e($product_quotation->qty); ?>" step="any"/></td>
                                                       
                                                       
                                                        <td class="net_unit_cost">
                                                        <?php
                                                         $iran=number_format((float)$net_unit_cost, 2, '.', '');
                                                         echo     substr($iran, 0, -3)  ;
                                                        ?>
                                                        
                                                        
                                                        </td>
                                                        
                                                        
                                                        <td class="discount">
                                                        
                                                           <?php
                                                         $iran= number_format((float)$product_quotation->discount, 2, '.', '');
                                                         echo     substr($iran, 0, -3)  ;
                                                        ?>
                                                        
                                                        </td>
                                                        <td class="tax"><?php echo e(number_format((float)$tax, 2, '.', '')); ?></td>
                                                        <td class="sub-total"><?php echo e(number_format((float)$sub_total, 2, '.', '')); ?></td>
                                                        
                                                        
                                                        
                                                        <td><button type="button" class="ibtnDel btn btn-md btn-danger"><?php echo e(trans("file.delete")); ?></button></td>
                                                        <input type="hidden" class="product-id" name="product_id[]" value="<?php echo e($product_data->id); ?>"/>
                                                        <input type="hidden" class="product-code" name="product_code[]" value="<?php echo e($product_data->code); ?>"/>
                                                        <input type="hidden" class="product-cost" name="product_cost[]" value="<?php echo e($product_cost); ?>"/>
                                                        <input type="hidden" class="purchase-unit" name="purchase_unit[]" value="<?php echo e($unit_name); ?>"/>
                                                        <input type="hidden" class="purchase-unit-operator" value="<?php echo e($unit_operator); ?>"/>
                                                        <input type="hidden" class="purchase-unit-operation-value" value="<?php echo e($unit_operation_value); ?>"/>
                                                        <input type="hidden" class="net_unit_cost" name="net_unit_cost[]" value="<?php echo e($net_unit_cost); ?>" />
                                                        <input type="hidden" class="discount-value" name="discount[]" value="<?php echo e($product_quotation->discount); ?>" />
                                                        <input type="hidden" class="tax-rate" name="tax_rate[]" value="<?php echo e($product_quotation->tax_rate); ?>"/>
                                                        <?php if($tax): ?>
                                                        <input type="hidden" class="tax-name" value="<?php echo e($tax_data->name); ?>" />
                                                        <?php else: ?>
                                                        <input type="hidden" class="tax-name" value="No Tax" />
                                                        <?php endif; ?>
                                                        <input type="hidden" class="tax-method" value="<?php echo e($product_data->tax_method); ?>"/>
                                                        <input type="hidden" class="tax-value" name="tax[]" value="<?php echo e($tax); ?>" />
                                                        <input type="hidden" class="subtotal-value" name="subtotal[]" value="<?php echo e($sub_total); ?>" />
                                                    </tr>
                                                    <?php endif; ?>
                                                    <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                                                </tbody>
                                                <tfoot class="tfoot active">
                                                    <th colspan="2"><?php echo e(trans('file.Total')); ?></th>
                                                    <th id="total-qty"><?php echo e($lims_quotation_data->total_qty); ?></th>
                                                    <th></th>
                                                    <th class="recieved-product-qty d-none"></th>
                                                    <th id="total-discount">
                                                    
                                                      <?php
                                                         $iran=number_format((float)$lims_quotation_data->total_discount, 2, '.', '');
                                                         echo     substr($iran, 0, -3)  ;
                                                        ?>
                                                    
                                                    </th>
                                                    <th id="total-tax"><?php echo e(number_format((float)$lims_quotation_data->total_tax, 2, '.', '')); ?></th>
                                                    <th id="total"><?php echo e(number_format((float)$lims_quotation_data->total_cost, 2, '.', '')); ?></th>
                                                    <th><i class="dripicons-trash"></i></th>
                                                </tfoot>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-2">
                                        <div class="form-group">
                                            <input type="hidden" name="total_qty" value="<?php echo e($lims_quotation_data->total_qty); ?>" />
                                        </div>
                                    </div>
                                    <div class="col-md-2">
                                        <div class="form-group">
                                            <input type="hidden" name="total_discount" value="<?php echo e($lims_quotation_data->total_discount); ?>" />
                                        </div>
                                    </div>
                                    <div class="col-md-2">
                                        <div class="form-group">
                                            <input type="hidden" name="total_tax" value="<?php echo e($lims_quotation_data->total_tax); ?>" />
                                        </div>
                                    </div>
                                    <div class="col-md-2">
                                        <div class="form-group">
                                            <input type="hidden" name="total_cost" value="<?php echo e($lims_quotation_data->total_cost); ?>" />
                                        </div>
                                    </div>
                                    <div class="col-md-2">
                                        <div class="form-group">
                                            <input type="hidden" name="item" value="<?php echo e($lims_quotation_data->item); ?>" />
                                            <input type="hidden" name="order_tax" value="<?php echo e($lims_quotation_data->order_tax); ?>"/>
                                        </div>
                                    </div>
                                    <div class="col-md-2">
                                        <div class="form-group">
                                            <input type="hidden" name="grand_total" value="" />
                                            <input type="hidden" name="paid_amount" value="0.00" />
                                            <input type="hidden" name="payment_status" value="1" />
                                        </div>
                                    </div>
                                </div>
                                <div class="row mt-3">
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label><?php echo e(trans('file.Order Tax')); ?></label>
                                            <input type="hidden" name="order_tax_rate_hidden" value="<?php echo e($lims_quotation_data->order_tax_rate); ?>">
                                            <select class="form-control" name="order_tax_rate">
                                                <option value="0"><?php echo e(trans('file.No Tax')); ?></option>
                                                <?php $__currentLoopData = $lims_tax_list; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $tax): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                                <option value="<?php echo e($tax->rate); ?>"><?php echo e($tax->name); ?></option>
                                                <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label>
                                                <strong><?php echo e(trans('file.Discount')); ?></strong>
                                            </label>
                                            <input type="number" name="order_discount" class="form-control" value="<?php echo e($lims_quotation_data->order_discount); ?>" step="any" />
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label>
                                                <strong><?php echo e(trans('file.Shipping Cost')); ?></strong>
                                            </label>
                                            <input type="number" name="shipping_cost" class="form-control" value="<?php echo e($lims_quotation_data->shipping_cost); ?>" step="any" />
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <label><?php echo e(trans('file.Note')); ?></label>
                                            <textarea rows="5" class="form-control" name="note" ><?php echo e($lims_quotation_data->note); ?></textarea>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <input type="submit" value="<?php echo e(trans('file.submit')); ?>" class="btn btn-primary" id="submit-button">
                                </div>
                            </div>
                        </div>
                        <?php echo Form::close(); ?>

                    </div>
                </div>
            </div>
        </div>
    </div>
   <div class="container-fluid">
        <table class="table table-bordered table-condensed totals">
            <td style="    background-color: #fff;text-align: center;"><strong style="font-weight: 100;"><?php echo e(trans('تعداد محصول')); ?></strong><br>
                <span class="pull-right" id="item" style="text-align: center;    float: none;">0.0</span>
            </td>
            <td style="    background-color: #fff;text-align: center;"><strong style="font-weight: 100;"><?php echo e(trans('مبلغ کل')); ?></strong><br>
                <span class="pull-right" id="subtotal" style="text-align: center;    float: none;">0.0</span>
            </td>
            <td style="    background-color: #fff;text-align: center;" ><strong style="font-weight: 100;"><?php echo e(trans('جمع مالیات')); ?></strong><br>
                <span class="pull-right" id="order_tax" style="text-align: center;    float: none;">0.0</span>
            </td>
            <td style="    background-color: #fff;text-align: center;"><strong style="font-weight: 100;"><?php echo e(trans('مبلغ تخفیف')); ?></strong><br>
                <span class="pull-right" id="order_discount" style="text-align: center;    float: none;">0.0</span>
            </td>
            <td style="    background-color: #fff;text-align: center;"><strong style="font-weight: 100;"><?php echo e(trans('file.Shipping Cost')); ?></strong><br>
                <span class="pull-right" id="shipping_cost" style="text-align: center;    float: none;">0.0</span>
            </td>
            <td style="    background-color: #fff;text-align: center;background-color: rgba(142,213,87,.2);    color: #8ed557;font-weight: 100;"><strong><?php echo e(trans('جمع مبلغ کــل')); ?></strong><br>
                <span class="pull-right" id="grand_total" style="text-align: center;    float: none;">0.0</span>
            </td>
        </table>
    </div>
    <div id="editModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true" class="modal fade text-left">
        <div role="document" class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 id="modal_header" class="modal-title"></h5>
                    <button type="button" data-dismiss="modal" aria-label="Close" class="close"><span aria-hidden="true"><i class="dripicons-cross"></i></span></button>
                </div>
                <div class="modal-body">
                    <form>
                        <div class="form-group">
                            <label><?php echo e(trans('file.Quantity')); ?></label>
                            <input type="number" name="edit_qty" class="form-control" step="any">
                        </div>
                        <div class="form-group">
                            <label><?php echo e(trans('file.Unit Discount')); ?></label>
                            <input type="number" name="edit_discount" class="form-control" step="any">
                        </div>
                        <div class="form-group">
                            <label><?php echo e(trans('file.Unit Cost')); ?></label>
                            <input type="number" name="edit_unit_cost" class="form-control" step="any">
                        </div>
                        <?php
                            $tax_name_all[] = 'No Tax';
                            $tax_rate_all[] = 0;
                            foreach($lims_tax_list as $tax) {
                                $tax_name_all[] = $tax->name;
                                $tax_rate_all[] = $tax->rate;
                            }
                        ?>
                            <div class="form-group">
                                <label><?php echo e(trans('file.Tax Rate')); ?></label>
                                <select name="edit_tax_rate" class="form-control selectpicker">
                                    <?php $__currentLoopData = $tax_name_all; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $key => $name): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                    <option value="<?php echo e($key); ?>"><?php echo e($name); ?></option>
                                    <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                                </select>
                            </div>
                            <div class="form-group">
                                <label><?php echo e(trans('file.Product Unit')); ?></label>
                                <select name="edit_unit" class="form-control selectpicker">
                                </select>
                            </div>
                            <button type="button" name="update_btn" class="btn btn-primary"><?php echo e(trans('file.update')); ?></button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</section>

<script type="text/javascript">
    $("ul#purchase").siblings('a').attr('aria-expanded','true');
    $("ul#purchase").addClass("show");
    $("ul#purchase #purchase-create-menu").addClass("active");
// array data depend on warehouse
var lims_product_array = [];
var product_code = [];
var product_name = [];
var product_qty = [];

// array data with selection
var product_cost = [];
var product_discount = [];
var tax_rate = [];
var tax_name = [];
var tax_method = [];
var unit_name = [];
var unit_operator = [];
var unit_operation_value = [];

// temporary array
var temp_unit_name = [];
var temp_unit_operator = [];
var temp_unit_operation_value = [];

var rowindex;
var customer_group_rate;
var row_product_cost;

var rownumber = $('table.order-list tbody tr:last').index();

for(rowindex  =0; rowindex <= rownumber; rowindex++){

    product_cost.push(parseFloat($('table.order-list tbody tr:nth-child(' + (rowindex + 1) + ')').find('.product-cost').val()));
    var total_discount = parseFloat($('table.order-list tbody tr:nth-child(' + (rowindex + 1) + ')').find('td:nth-child(6)').text());
    var quantity = parseFloat($('table.order-list tbody tr:nth-child(' + (rowindex + 1) + ')').find('.qty').val());
    product_discount.push((total_discount / quantity).toFixed(2));
    tax_rate.push(parseFloat($('table.order-list tbody tr:nth-child(' + (rowindex + 1) + ')').find('.tax-rate').val()));
    tax_name.push($('table.order-list tbody tr:nth-child(' + (rowindex + 1) + ')').find('.tax-name').val());
    tax_method.push($('table.order-list tbody tr:nth-child(' + (rowindex + 1) + ')').find('.tax-method').val());
    temp_unit_name = $('table.order-list tbody tr:nth-child(' + (rowindex + 1) + ')').find('.purchase-unit').val().split(',');
    unit_name.push($('table.order-list tbody tr:nth-child(' + (rowindex + 1) + ')').find('.purchase-unit').val());
    unit_operator.push($('table.order-list tbody tr:nth-child(' + (rowindex + 1) + ')').find('.purchase-unit-operator').val());
    unit_operation_value.push($('table.order-list tbody tr:nth-child(' + (rowindex + 1) + ')').find('.purchase-unit-operation-value').val());
    $('table.order-list tbody tr:nth-child(' + (rowindex + 1) + ')').find('.purchase-unit').val(temp_unit_name[0]);
}


$('.selectpicker').selectpicker({
    style: 'btn-link',
});

$('[data-toggle="tooltip"]').tooltip();

//assigning value
$('select[name="supplier_id"]').val($('input[name="supplier_id_hidden"]').val());
$('select[name="warehouse_id"]').val($('input[name="warehouse_id_hidden"]').val());
$('select[name="order_tax_rate"]').val($('input[name="order_tax_rate_hidden"]').val());
$('.selectpicker').selectpicker('refresh');

$('#item').text($('input[name="item"]').val() + '(' + $('input[name="total_qty"]').val() + ')');
$('#subtotal').text(parseFloat($('input[name="total_cost"]').val()).toFixed(0));
$('#order_tax').text(parseFloat($('input[name="order_tax"]').val()).toFixed(0));
if(!$('input[name="order_discount"]').val())
    $('input[name="order_discount"]').val('0.00');
$('#order_discount').text(parseFloat($('input[name="order_discount"]').val()).toFixed(0));
if(!$('input[name="shipping_cost"]').val())
    $('input[name="shipping_cost"]').val('0.00');
$('#shipping_cost').text(parseFloat($('input[name="shipping_cost"]').val()).toFixed(0));
$('#grand_total').text(parseFloat($('input[name="grand_total"]').val()).toFixed(0));
calculateTotal();
$('select[name="status"]').on('change', function() {
    if($('select[name="status"]').val() == 2){
        $(".recieved-product-qty").removeClass("d-none");
        $(".qty").each(function() {
            rowindex = $(this).closest('tr').index();
            $('table.order-list tbody tr:nth-child(' + (rowindex + 1) + ')').find('.recieved').val($(this).val());
        });

    }
    else if(($('select[name="status"]').val() == 3) || ($('select[name="status"]').val() == 4)){
        $(".recieved-product-qty").addClass("d-none");
        $(".recieved").each(function() {
            $(this).val(0);
        });
    }
    else {
        $(".recieved-product-qty").addClass("d-none");
        $(".qty").each(function() {
            rowindex = $(this).closest('tr').index();
            $('table.order-list tbody tr:nth-child(' + (rowindex + 1) + ')').find('.recieved').val($(this).val());
        });
    }
});

<?php $productArray = []; ?>
var lims_product_code = [
    <?php $__currentLoopData = $lims_product_list_without_variant; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $product): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
        <?php
            $productArray[] = $product->code . ' (' . $product->name . ')';
        ?>
    <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
    <?php $__currentLoopData = $lims_product_list_with_variant; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $product): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
        <?php
            $productArray[] = $product->item_code . ' (' . $product->name . ')';
        ?>
    <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
        <?php
        echo  '"'.implode('","', $productArray).'"';
        ?> 
];

    var lims_productcodeSearch = $('#lims_productcodeSearch');

    lims_productcodeSearch.autocomplete({
    source: function(request, response) {
        var matcher = new RegExp(".?" + $.ui.autocomplete.escapeRegex(request.term), "i");
        response($.grep(lims_product_code, function(item) {
            return matcher.test(item);
        }));
    },
    response: function(event, ui) {
        if (ui.content.length == 1) {
            var data = ui.content[0].value;
            $(this).autocomplete( "close" );
            productSearch(data);
        };
    },
    select: function(event, ui) {
        var data = ui.item.value;
        productSearch(data);
    }
});


//Change quantity
$("#myTable").on('input', '.qty', function() {
    rowindex = $(this).closest('tr').index();
    if($(this).val() < 1 && $(this).val() != '') {
      $('table.order-list tbody tr:nth-child(' + (rowindex + 1) + ') .qty').val(1);
      alert("Quantity can't be less than 1");
    }
    checkQuantity($(this).val(), true);
});


//Delete product
$("table.order-list tbody").on("click", ".ibtnDel", function(event) {
    rowindex = $(this).closest('tr').index();
    product_cost.splice(rowindex, 1);
    product_discount.splice(rowindex, 1);
    tax_rate.splice(rowindex, 1);
    tax_name.splice(rowindex, 1);
    tax_method.splice(rowindex, 1);
    unit_name.splice(rowindex, 1);
    unit_operator.splice(rowindex, 1);
    unit_operation_value.splice(rowindex, 1);
    $(this).closest("tr").remove();
    calculateTotal();
});

//Edit product
$("table.order-list").on("click", ".edit-product", function() {
    rowindex = $(this).closest('tr').index();
    var row_product_name = $('table.order-list tbody tr:nth-child(' + (rowindex + 1) + ')').find('td:nth-child(1)').text();
    var row_product_code = $('table.order-list tbody tr:nth-child(' + (rowindex + 1) + ')').find('td:nth-child(2)').text();
    $('#modal_header').text(row_product_name + '(' + row_product_code + ')');

    var qty = $(this).closest('tr').find('.qty').val();
    $('input[name="edit_qty"]').val(qty);

    $('input[name="edit_discount"]').val(parseFloat(product_discount[rowindex]).toFixed(2));

    unitConversion();
    $('input[name="edit_unit_cost"]').val(row_product_cost.toFixed(2));

    var tax_name_all = <?php echo json_encode($tax_name_all) ?>;
    var pos = tax_name_all.indexOf(tax_name[rowindex]);
    $('select[name="edit_tax_rate"]').val(pos);

    temp_unit_name = (unit_name[rowindex]).split(',');
    temp_unit_name.pop();
    temp_unit_operator = (unit_operator[rowindex]).split(',');
    temp_unit_operator.pop();
    temp_unit_operation_value = (unit_operation_value[rowindex]).split(',');
    temp_unit_operation_value.pop();
    $('select[name="edit_unit"]').empty();
    $.each(temp_unit_name, function(key, value) {
        $('select[name="edit_unit"]').append('<option value="' + key + '">' + value + '</option>');
    });
    $('.selectpicker').selectpicker('refresh');
});

//Update product
$('button[name="update_btn"]').on("click", function() {
    var edit_discount = $('input[name="edit_discount"]').val();
    var edit_qty = $('input[name="edit_qty"]').val();
    var edit_unit_cost = $('input[name="edit_unit_cost"]').val();

    if (parseFloat(edit_discount) > parseFloat(edit_unit_cost)) {
        alert('Invalid Discount Input!');
        return;
    }

    if(edit_qty < 1) {
        $('input[name="edit_qty"]').val(1);
        edit_qty = 1;
        alert("Quantity can't be less than 1");
    }

    var row_unit_operator = unit_operator[rowindex].slice(0, unit_operator[rowindex].indexOf(","));
    var row_unit_operation_value = unit_operation_value[rowindex].slice(0, unit_operation_value[rowindex].indexOf(","));
    row_unit_operation_value = parseFloat(row_unit_operation_value);
    var tax_rate_all = <?php echo json_encode($tax_rate_all) ?>;


    tax_rate[rowindex] = parseFloat(tax_rate_all[$('select[name="edit_tax_rate"]').val()]);
    tax_name[rowindex] = $('select[name="edit_tax_rate"] option:selected').text();


    if (row_unit_operator == '*') {
        product_cost[rowindex] = $('input[name="edit_unit_cost"]').val() / row_unit_operation_value;
    } else {
        product_cost[rowindex] = $('input[name="edit_unit_cost"]').val() * row_unit_operation_value;
    }

    product_discount[rowindex] = $('input[name="edit_discount"]').val();
    var position = $('select[name="edit_unit"]').val();
    var temp_operator = temp_unit_operator[position];
    var temp_operation_value = temp_unit_operation_value[position];
    $('table.order-list tbody tr:nth-child(' + (rowindex + 1) + ')').find('.purchase-unit').val(temp_unit_name[position]);
    temp_unit_name.splice(position, 1);
    temp_unit_operator.splice(position, 1);
    temp_unit_operation_value.splice(position, 1);

    temp_unit_name.unshift($('select[name="edit_unit"] option:selected').text());
    temp_unit_operator.unshift(temp_operator);
    temp_unit_operation_value.unshift(temp_operation_value);

    unit_name[rowindex] = temp_unit_name.toString() + ',';
    unit_operator[rowindex] = temp_unit_operator.toString() + ',';
    unit_operation_value[rowindex] = temp_unit_operation_value.toString() + ',';
    checkQuantity(edit_qty, false);
});

function productSearch(data){
    $.ajax({
        type: 'GET',
        url: '../../purchases/lims_product_search',
        data: {
            data: data
        },
        success: function(data) {
            var flag = 1;
            $(".product-code").each(function(i) {
                if ($(this).val() == data[1]) {
                    rowindex = i;
                    var qty = parseFloat($('table.order-list tbody tr:nth-child(' + (rowindex + 1) + ') .qty').val()) + 1;
                    $('table.order-list tbody tr:nth-child(' + (rowindex + 1) + ') .qty').val(qty);
                    $('table.order-list tbody tr:nth-child(' + (rowindex + 1) + ') .recieved').val(qty);
                    calculateRowProductData(qty);
                    flag = 0;
                }
            });
            $("input[name='product_code_name']").val('');
            if(flag){
                var newRow = $("<tr>");
                var cols = '';
                temp_unit_name = (data[6]).split(',');
                cols += '<td>' + data[0] + '<button type="button" class="edit-product btn btn-link" data-toggle="modal" data-target="#editModal"> <i class="dripicons-document-edit"></i></button></td>';
                cols += '<td>' + data[1] + '</td>';
                cols += '<td><input type="number" class="form-control qty" name="qty[]" value="1" step="any" required/></td>';
                if($('select[name="status"]').val() == 1)
                    cols += '<td class="recieved-product-qty d-none"><input type="number" class="form-control recieved" name="recieved[]" value="1" step="any"/></td>';
                else if($('select[name="status"]').val() == 2)
                    cols += '<td class="recieved-product-qty"><input type="number" class="form-control recieved" name="recieved[]" value="1" step="any"/></td>';
                else
                    cols += '<td class="recieved-product-qty d-none"><input type="number" class="form-control recieved" name="recieved[]" value="0" step="any"/></td>';
                cols += '<td class="net_unit_cost"></td>';
                cols += '<td class="discount">0.00</td>';
                cols += '<td class="tax"></td>';
                cols += '<td class="sub-total"></td>';
                cols += '<td><button type="button" class="ibtnDel btn btn-md btn-danger"><?php echo e(trans("file.delete")); ?></button></td>';
                cols += '<input type="hidden" class="product-code" name="product_code[]" value="' + data[1] + '"/>';
                cols += '<input type="hidden" class="product-id" name="product_id[]" value="' + data[9] + '"/>';
                cols += '<input type="hidden" class="purchase-unit" name="purchase_unit[]" value="' + temp_unit_name[0] + '"/>';
                cols += '<input type="hidden" class="net_unit_cost" name="net_unit_cost[]" />';
                cols += '<input type="hidden" class="discount-value" name="discount[]" />';
                cols += '<input type="hidden" class="tax-rate" name="tax_rate[]" value="' + data[3] + '"/>';
                cols += '<input type="hidden" class="tax-value" name="tax[]" />';
                cols += '<input type="hidden" class="subtotal-value" name="subtotal[]" />';

                newRow.append(cols);
                $("table.order-list tbody").append(newRow);

                product_cost.push(parseFloat(data[2]));
                product_discount.push('0.00');
                tax_rate.push(parseFloat(data[3]));
                tax_name.push(data[4]);
                tax_method.push(data[5]);
                unit_name.push(data[6]);
                unit_operator.push(data[7]);
                unit_operation_value.push(data[8]);
                rowindex = newRow.index();
                calculateRowProductData(1);
            }
        }
    });
}

function checkQuantity(purchase_qty, flag) {
    var row_product_code = $('table.order-list tbody tr:nth-child(' + (rowindex + 1) + ')').find('td:nth-child(2)').text();
    var pos = product_code.indexOf(row_product_code);
    var operator = unit_operator[rowindex].split(',');
    var operation_value = unit_operation_value[rowindex].split(',');
    if(operator[0] == '*')
        total_qty = purchase_qty * operation_value[0];
    else if(operator[0] == '/')
        total_qty = purchase_qty / operation_value[0];

    $('#editModal').modal('hide');
    $('table.order-list tbody tr:nth-child(' + (rowindex + 1) + ')').find('.qty').val(purchase_qty);
    var status = $('select[name="status"]').val();
    if(status == '1' || status == '2' )
        $('table.order-list tbody tr:nth-child(' + (rowindex + 1) + ')').find('.recieved').val(purchase_qty);

    calculateRowProductData(purchase_qty);
}

function calculateRowProductData(quantity) {
    unitConversion();
    $('table.order-list tbody tr:nth-child(' + (rowindex + 1) + ')').find('td:nth-child(6)').text((product_discount[rowindex] * quantity).toFixed(0));
    $('table.order-list tbody tr:nth-child(' + (rowindex + 1) + ')').find('.discount-value').val((product_discount[rowindex] * quantity).toFixed(0));
    $('table.order-list tbody tr:nth-child(' + (rowindex + 1) + ')').find('.tax-rate').val(tax_rate[rowindex].toFixed(2));

    if (tax_method[rowindex] == 1) {
        var net_unit_cost = row_product_cost - product_discount[rowindex];
        var tax = net_unit_cost * quantity * (tax_rate[rowindex] / 100);
        var sub_total = (net_unit_cost * quantity) + tax;

        $('table.order-list tbody tr:nth-child(' + (rowindex + 1) + ')').find('td:nth-child(5)').text(net_unit_cost.toFixed(0));
        $('table.order-list tbody tr:nth-child(' + (rowindex + 1) + ')').find('.net_unit_cost').val(net_unit_cost.toFixed(0));
        $('table.order-list tbody tr:nth-child(' + (rowindex + 1) + ')').find('td:nth-child(7)').text(tax.toFixed(0));
        $('table.order-list tbody tr:nth-child(' + (rowindex + 1) + ')').find('.tax-value').val(tax.toFixed(0));
        $('table.order-list tbody tr:nth-child(' + (rowindex + 1) + ')').find('td:nth-child(8)').text(sub_total.toFixed(0));
        $('table.order-list tbody tr:nth-child(' + (rowindex + 1) + ')').find('.subtotal-value').val(sub_total.toFixed(0));
    } else {
        var sub_total_unit = row_product_cost - product_discount[rowindex];
        var net_unit_cost = (100 / (100 + tax_rate[rowindex])) * sub_total_unit;
        var tax = (sub_total_unit - net_unit_cost) * quantity;
        var sub_total = sub_total_unit * quantity;

        $('table.order-list tbody tr:nth-child(' + (rowindex + 1) + ')').find('td:nth-child(5)').text(net_unit_cost.toFixed(0));
        $('table.order-list tbody tr:nth-child(' + (rowindex + 1) + ')').find('.net_unit_cost').val(net_unit_cost.toFixed(0));
        $('table.order-list tbody tr:nth-child(' + (rowindex + 1) + ')').find('td:nth-child(7)').text(tax.toFixed(0));
        $('table.order-list tbody tr:nth-child(' + (rowindex + 1) + ')').find('.tax-value').val(tax.toFixed(0));
        $('table.order-list tbody tr:nth-child(' + (rowindex + 1) + ')').find('td:nth-child(8)').text(sub_total.toFixed(0));
        $('table.order-list tbody tr:nth-child(' + (rowindex + 1) + ')').find('.subtotal-value').val(sub_total.toFixed(0));
    }

    calculateTotal();
}

function unitConversion() {
    var row_unit_operator = unit_operator[rowindex].slice(0, unit_operator[rowindex].indexOf(","));
    var row_unit_operation_value = unit_operation_value[rowindex].slice(0, unit_operation_value[rowindex].indexOf(","));
    row_unit_operation_value = parseFloat(row_unit_operation_value);
    if (row_unit_operator == '*') {
        row_product_cost = product_cost[rowindex] * row_unit_operation_value;
    } else {
        row_product_cost = product_cost[rowindex] / row_unit_operation_value;
    }
}

function calculateTotal() {
    //Sum of quantity
    var total_qty = 0;
    $(".qty").each(function() {

        if ($(this).val() == '') {
            total_qty += 0;
        } else {
            total_qty += parseFloat($(this).val());
        }
    });
    $("#total-qty").text(total_qty);
    $('input[name="total_qty"]').val(total_qty);

    //Sum of discount
    var total_discount = 0;
    $(".discount").each(function() {
        total_discount += parseFloat($(this).text());
    });
    $("#total-discount").text(total_discount.toFixed(0));
    $('input[name="total_discount"]').val(total_discount.toFixed(0));

    //Sum of tax
    var total_tax = 0;
    $(".tax").each(function() {
        total_tax += parseFloat($(this).text());
    });
    $("#total-tax").text(total_tax.toFixed(0));
    $('input[name="total_tax"]').val(total_tax.toFixed(0));

    //Sum of subtotal
    var total = 0;
    $(".sub-total").each(function() {
        total += parseFloat($(this).text());
    });
    $("#total").text(total.toFixed(0));
    $('input[name="total_cost"]').val(total.toFixed(0));

    calculateGrandTotal();
}

function calculateGrandTotal() {

    var item = $('table.order-list tbody tr:last').index();

    var total_qty = parseFloat($('#total-qty').text());
    var subtotal = parseFloat($('#total').text());
    var order_tax = parseFloat($('select[name="order_tax_rate"]').val());
    var order_discount = parseFloat($('input[name="order_discount"]').val());
    var shipping_cost = parseFloat($('input[name="shipping_cost"]').val());

    if (!order_discount)
        order_discount = 0.00;
    if (!shipping_cost)
        shipping_cost = 0.00;

    item = ++item + '(' + total_qty + ')';
    order_tax = (subtotal - order_discount) * (order_tax / 100);
    var grand_total = (subtotal + order_tax + shipping_cost) - order_discount;

    $('#item').text(item);
    $('input[name="item"]').val($('table.order-list tbody tr:last').index() + 1);
    $('#subtotal').text(subtotal.toFixed(0));
    $('#order_tax').text(order_tax.toFixed(0));
    $('input[name="order_tax"]').val(order_tax.toFixed(0));
    $('#order_discount').text(order_discount.toFixed(0));
    $('#shipping_cost').text(shipping_cost.toFixed(0));
    $('#grand_total').text(grand_total.toFixed(0));
    $('input[name="grand_total"]').val(grand_total.toFixed(0));
}

$('input[name="order_discount"]').on("input", function() {
    calculateGrandTotal();
});

$('input[name="shipping_cost"]').on("input", function() {
    calculateGrandTotal();
});

$('select[name="order_tax_rate"]').on("change", function() {
    calculateGrandTotal();
});

$(window).keydown(function(e){
    if (e.which == 13) {
        var $targ = $(e.target);
        if (!$targ.is("textarea") && !$targ.is(":button,:submit")) {
            var focusNext = false;
            $(this).find(":input:visible:not([disabled],[readonly]), a").each(function(){
                if (this === e.target) {
                    focusNext = true;
                }
                else if (focusNext){
                    $(this).focus();
                    return false;
                }
            });
            return false;
        }
    }
});

$('#purchase-form').on('submit',function(e){
    var rownumber = $('table.order-list tbody tr:last').index();
    if (rownumber < 0) {
        alert("Please insert product to order table!")
        e.preventDefault();
    }

    else if($('select[name="status"]').val() != 1)
    {
        flag = 0;
        $(".qty").each(function() {
            rowindex = $(this).closest('tr').index();
            quantity =  $(this).val();
            recieved = $('table.order-list tbody tr:nth-child(' + (rowindex + 1) + ')').find('.recieved').val();

            if(quantity != recieved){
                flag = 1;
                return false;
            }
        });
        if(!flag){
            alert('مقدار و ارزش دریافتی یکسان است! لطفاً وضعیت خرید یا ارزش دریافتی را تغییر دهید');
            e.preventDefault();
        }
    }
});

</script>
<?php $__env->stopSection(); ?>
<?php echo $__env->make('layout.main', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH /home/edogroup/edosale.edogroup.ir/resources/views/quotation/create_purchase.blade.php ENDPATH**/ ?>