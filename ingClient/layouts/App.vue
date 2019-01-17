<template>
    <div id="wrapper">
        <nav class="navbar-default navbar-static-side mini-navbar" role="navigation">
            <div class="sidebar-collapse">
                <ul class="nav" id="side-menu">
                    <li class="nav-header">
                        <div class="logo-element">
                            IN+
                        </div>
                    </li>
                </ul>
            </div>
        </nav>
        <div id="page-wrapper" class="gray-bg dashbard-1">
            <div class="row border-bottom">
                <nav class="navbar navbar-static-top" role="navigation" style="margin-bottom: 0">
                    <div class="navbar-header">
                        <a class="navbar-minimalize minimalize-styl-2 btn btn-primary " href="#"><i class="fa fa-bars"></i> </a>
                    </div>
                </nav>
            </div>
            <div class="row border-bottom white-bg dashboard-header">
                <nuxt/>                        
            </div>
                <div class="row">
                    <div class="col-lg-12">
                        
                    </div>
                </div>
                <div class="footer">
                    <div class="pull-right">
                        10GB of <strong>250GB</strong> Free.
                    </div>
                <div>
                    <strong>Copyright</strong> Example Company &copy; 2014-2015
                </div>
            </div>
        </div>
    </div>
</template>
<script>
export default {
    head () {
    return {
      script: [
        { src: '/js/jquery-2.1.1.js',body: true,type: "text/javascript"},
        { src: '/js/bootstrap.min.js',body: true,type: "text/javascript"},
        { src: '/js/plugins/metisMenu/jquery.metisMenu.js',body: true ,type: "text/javascript"},
        { src: '/js/plugins/slimscroll/jquery.slimscroll.min.js',body: true,type: "text/javascript" },

        { src: '/js/plugins/flot/jquery.flot.js',body: true ,type: "text/javascript"},
        { src: '/js/plugins/flot/jquery.flot.tooltip.min.js',body: true,type: "text/javascript" },
        { src: '/js/plugins/flot/jquery.flot.spline.js',body: true,type: "text/javascript"},
        { src: '/js/plugins/flot/jquery.flot.resize.js',body: true,type: "text/javascript" },
        { src: '/js/plugins/flot/jquery.flot.pie.js',body: true,type: "text/javascript" },

        { src: '/js/plugins/peity/jquery.peity.min.js',body: true,type: "text/javascript" },
        { src: '/js/demo/peity-demo.js',body: true,type: "text/javascript" },

        { src: '/js/inspinia.js',body: true ,type: "text/javascript"},
        { src: '/js/plugins/pace/pace.min.js',body: true ,type: "text/javascript"},

        { src: '/js/plugins/jquery-ui/jquery-ui.min.js',body: true ,type: "text/javascript"},

        { src: '/js/plugins/gritter/jquery.gritter.min.js',body: true,type: "text/javascript" },

        { src: '/js/plugins/sparkline/jquery.sparkline.min.js',body: true,type: "text/javascript" },

        { src: '/js/demo/sparkline-demo.js',body: true,type: "text/javascript" },

        { src: '/js/plugins/chartJs/Chart.min.js',body: true ,type: "text/javascript"},

        { src: '/js/plugins/toastr/toastr.min.js',body: true ,type: "text/javascript"}
      ],
      link: [
        { rel: 'stylesheet', href: '/css/bootstrap.min.css' },
        { rel: 'stylesheet', href: '/font-awesome/css/font-awesome.css' },
        { rel: 'stylesheet', href: '/css/plugins/toastr/toastr.min.css' },
        { rel: 'stylesheet', href: '/js/plugins/gritter/jquery.gritter.css' },
        { rel: 'stylesheet', href: '/css/animate.css' },
        { rel: 'stylesheet', href: '/css/style.css' }
      ]
    } 
  }
}
</script>


