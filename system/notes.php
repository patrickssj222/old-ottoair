<?php
/**
 * Just to keep the readers (if any) in the loop. We urgently need the webpate
 * running ASAP. I figured that a simple MVC which I can compose within 3~4 hrs
 * will save me tons of trouble parsing our old code and ahead. And so here it is,
 * a rough, weak, half-done, unoptimized, but light & sort-a working HMVC framework.
 *
 *
 *
 *                         ### Kick Start BELOW ###:
 *
 *
 * Q:  HMVC?
 *
 * A:  It is Hierarchical Model-View-Controller (+ Language). Model deals with
 *     database/fileIO directly. View/template determines how the page looks.
 *     Controller does all the logic work and connects everything else.
 *     Hierarchy allows controllers to nest controllers.
 *
 *
 * Q:  Conventions ?          ### !important! ###
 *
 * A:  All veriables and controller function names use snake_case. All other
 *         function names use camalCase. Model function names start with action
 *         verbs e.g., 'get','list','edit','delete'
 *
 *     $this->user is available in all DashboardControllers.
 *
 *     View utilizes shorthand <?=$v?> (same as <?php echo $v; ?>) to print variables.
 *
 *     All database table names start with DB_PREFIX.
 *
 *     Always escape inputs: $this->db->escape() before querying: $this->db->query()
 *
 *     All instantiatable components (except languages and views) are PHP classes
 *         named [Type][PathToFile] that can be loaded via Loader.
 *         e.g., mvc/controller/common/sidebar.php must have a class named
 *         ControllerCommonSidebar, and is loaded by calling $sidebar =
 *         $this->load->controller('common/sidebar'), which makes it available at
 *         $sidebar or $this->controller_common_sidebar
 *
 *     The URL looks like [Host]/[Dir]/[PathToController]/[ControllerName]/[MethodName]/[Param1]/[Param2]...
 *         e.g., http://ottoair.ca/v3/dashboard/flight/detail/1/pay invokes function
 *         detail() in class ControllerFlight with 2 parameters '1' and 'pay'.
 *         Refer to index.php for details
 *
 *
 * Q:  Fun facts?
 *
 * A:  The SEO url is made possible by an .htaccess file, which rewrites
 *         the url and directs everything to index.php the router. So e.g.,
 *         http://ottoair.ca/v3/dashboard/flight becomes
 *         http://ottoair.ca/v3/dashboard/mvc/index.php?path=flight after rewrite.
 *         index.php then figures out which controller/method to look-for/call.
 *
 *     You have my thanks for making it this far down the notes.
 *
 *     This framework is heavily inspired by Opencart 3 and Bonfire, but no code
 *         was 'borrowed' whatsoever. Still, I am implicitly consiering it MIT
 *
 *
 *  The http://ottoair.ca/v3/dashboard/test will give you a full MVC example
 *
 *
 *                          ### END Kick Start ###:
 *
 *
 *
 * Barebone structure:
 * mvc
 *  | controller
 *  |  | test.php
 *  | language
 *  |  | en-gb
 *  |  |  | test.php
 *  | model
 *  |  | test.php
 *  | view
 *  |  | test
 *  |  |  | test.tpl
 *  |  | test.tpl
 *  | system
 *  |  | constants.php
 *  |  | registry.php
 *  |  | loader.php
 *  |  | db.php
 *  |  | controller.php
 *  |  | dashboard_controller.php
 *  |  | model.php
 *  |  notes.php (this file)
 *  |  index.php
 * .htaccess
 *
 * Otto v3 MVC speed prioritized
 *
 * Jack Mai
 * 2018-03-11
 * Last update: 2018-05-01
 */