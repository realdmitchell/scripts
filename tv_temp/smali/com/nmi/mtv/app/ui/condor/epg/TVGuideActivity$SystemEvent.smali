.class Lcom/nmi/mtv/app/ui/condor/epg/TVGuideActivity$SystemEvent;
.super Ljava/lang/Object;
.source "TVGuideActivity.java"

# interfaces
.implements Lcom/nmi/mtv/app/core/common/CommonInterface$OnSystemEventListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/nmi/mtv/app/ui/condor/epg/TVGuideActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "SystemEvent"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/nmi/mtv/app/ui/condor/epg/TVGuideActivity;


# direct methods
.method private constructor <init>(Lcom/nmi/mtv/app/ui/condor/epg/TVGuideActivity;)V
    .locals 0
    .param p1, "this$0"    # Lcom/nmi/mtv/app/ui/condor/epg/TVGuideActivity;

    .prologue
    .line 277
    iput-object p1, p0, Lcom/nmi/mtv/app/ui/condor/epg/TVGuideActivity$SystemEvent;->this$0:Lcom/nmi/mtv/app/ui/condor/epg/TVGuideActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/nmi/mtv/app/ui/condor/epg/TVGuideActivity;Lcom/nmi/mtv/app/ui/condor/epg/TVGuideActivity$SystemEvent;)V
    .locals 0
    .param p1, "this$0"    # Lcom/nmi/mtv/app/ui/condor/epg/TVGuideActivity;

    .prologue
    invoke-direct {p0, p1}, Lcom/nmi/mtv/app/ui/condor/epg/TVGuideActivity$SystemEvent;-><init>(Lcom/nmi/mtv/app/ui/condor/epg/TVGuideActivity;)V

    return-void
.end method


# virtual methods
.method public onSystemEvent(Ljava/lang/String;IILjava/lang/Object;)V
    .locals 1
    .param p1, "action"    # Ljava/lang/String;
    .param p2, "arg1"    # I
    .param p3, "arg2"    # I
    .param p4, "obj"    # Ljava/lang/Object;

    .prologue
    .line 279
    const-string/jumbo v0, "com.nmi.mtv.app.condor.ACTIVITY_CLOSE"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 280
    iget-object v0, p0, Lcom/nmi/mtv/app/ui/condor/epg/TVGuideActivity$SystemEvent;->this$0:Lcom/nmi/mtv/app/ui/condor/epg/TVGuideActivity;

    invoke-virtual {v0}, Lcom/nmi/mtv/app/ui/condor/epg/TVGuideActivity;->finish()V

    .line 278
    :cond_0
    return-void
.end method
